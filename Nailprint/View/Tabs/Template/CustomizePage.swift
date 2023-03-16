//
//  CustomizePage.swift
//  Nailprint
//
//  Created by Mesut Yılmaz on 15.03.2023.
//

import SwiftUI

struct CustomizePage: View {
    @State var shouldShowCamera : Bool = false
    @State var img : UIImage?
    @State var message : String = "Loading Results"
    @State var customizedAndEncodedStlURL : URL?
    @State var showPopupAddAlert : Bool = false
    
    var body: some View {
        
        VStack(spacing: 24){
            Text("Customize").font(.title)
            Text("First Take a Photo of your hand.")
            Text("Works best when you take the photo from 30 - 40 cm distance.")
            
            if(img == nil){
                Spacer()
                Button {
                    shouldShowCamera = true
                } label: {
                    Text("Take the Photo").padding(.all)
                }.buttonStyle(.borderedProminent)
            } else {
                Text(message)
                    .onAppear(perform: {
                    getCustomizedTemplate(img: img!)
                })
                
                if customizedAndEncodedStlURL != nil {
                    Button {
                        showPopupAddAlert = true
                        print("subscription")
                    } label: {
                        Text("Add to my Estée Lauder Subscription").padding(.all)
                    }
                    .buttonStyle(.borderedProminent)
                    .alert(isPresented: $showPopupAddAlert) {
                        Alert(title: Text("Successfully added to your Subscription"),
                              message: Text("You'll receive your template with the following subscription shipment."))
                    }
                    
                    Text("or")
                    
                    ShareLink(item: customizedAndEncodedStlURL!) {
                        Label("I'll print my template", systemImage: "square.and.arrow.up").padding(.all)
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                Spacer()
            }
        }.padding(.all)
            .sheet(isPresented: $shouldShowCamera) {
                CameraView(img: $img)
            }
    }
    
    func getCustomizedTemplate(img: UIImage) {
        let errorMessage = "A problem occured while customizing the template. Check your internet connection or try later."
        let data = img.jpegData(compressionQuality: 1)! as NSData
        let base64 = bs64Formatter(bs64: data.base64EncodedString())
        if let url = URL(string:  "http://192.168.1.190:3030/configure/nail_polisher") {
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = "img=\(base64)".data(using: .utf8)
                                     
            let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
                guard let data = data else {
                    message = errorMessage
                    return
                }
                do{
                    let obj : ServiceResponse = try JSONDecoder().decode(ServiceResponse.self, from: data)
                    let stl = obj.stlArchive
                    if(stl != ""){
                        let stlData = Data(base64Encoded: stl)
                        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("nailprint", conformingTo: .zip)
                        
                        try stlData!.write(to: path)
                        customizedAndEncodedStlURL = path
                    }
                    message = obj.message
                } catch {
                    print(error)
                    message = errorMessage + "!"
                }
                
            }
            task.resume()
        }
    }

    
}

struct CustomizePage_Previews: PreviewProvider {
    static var previews: some View {
        CustomizePage()
    }
}

