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
    @State var customTemplate : String = ""
    
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
                Text("Loading Results").onAppear(perform: {
                    getCustomizedTemplate(img: img!)
                })
                Text(customTemplate)
            }
        }.padding(.all)
            .sheet(isPresented: $shouldShowCamera) {
                CameraView(img: $img)
            }
    }
    
    func getCustomizedTemplate(img: UIImage) {
        let data = img.jpegData(compressionQuality: 1)! as NSData
        let base64 = data.base64EncodedString()
        
        if let url = URL(string:  "http://192.168.1.190:3030//configure/nail_polisher") {
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = "img=\(base64)".data(using: .utf8)
                                     
            let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
                guard let data = data else { return }
                let text = (String(data: data, encoding: .utf8)!)
                customTemplate = text
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

