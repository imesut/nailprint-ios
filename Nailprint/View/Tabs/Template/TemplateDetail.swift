//
//  TemplateDetail.swift
//  Nailprint
//
//  Created by Mesut Yılmaz on 12.03.2023.
//

import SwiftUI
import SceneKit

struct TemplateDetail: View {
    @State var readyToAdd = false
    @State var getModelPhase = 1
    @State var showExportDialog = false
    @State var showPopupAddAlert = false
    @State var color = Color(.white)
    
    var id : Int = 0
    var template : Template? = nil
    var stlFile = "nail_polisher"
    var scene = SCNScene(named: "nail_polisher.stl")
    var material = SCNMaterial()
    var cameraNode: SCNNode? {
        scene?.rootNode.childNode(withName: "camera", recursively: false)
    }
    var bundleItem = Bundle.main.url(forResource: "nail_polisher", withExtension: "stl")!
        
    init(id: Int) {
        self.id = id
        self.template = Templates[id]
        self.stlFile = Templates[id].stlFile
        self.scene = SCNScene(named: self.stlFile + ".stl")
        self.bundleItem = Bundle.main.url(forResource: self.stlFile, withExtension: "stl")!
        material.diffuse.contents = UIColor(.blue)
        scene?.rootNode.childNodes[0].geometry?.firstMaterial = material
    }
    
    var body: some View {
        
        ScrollView{
            
            SceneView(scene: scene, pointOfView: cameraNode, options: [
                .allowsCameraControl,
                .autoenablesDefaultLighting])
            .frame(height: 300)
            .padding(.bottom)
            
            HStack{
                Spacer()
                Image(systemName: "move.3d").resizable().scaledToFit()
                Image(systemName: "view.3d").resizable().scaledToFit()
            }.padding(.all)
                .frame(height: 50)
                .padding(.top, -60)
            
            Text(template!.name).font(.title)
            Text(template!.description).padding(.all)
            
            if (template!.customizable){
                Text("How to Customize?").font(.title2).padding(.all)
                Text(template!.customizationDescription).padding(.all)
            }
            
            HStack{
                Text("Get This Template ").font(.title2)
                if(template!.customizable){
                    Text(String(getModelPhase) + "/2").font(.title2)
                }
            }.padding(.all)
            
            if (!readyToAdd && template!.customizable){
                
                NavigationLink {
                    CustomizePage()
                } label: {
                    Text("Customize the Model").padding(.all)
                }.buttonStyle(.borderedProminent)
                
                Text("or")
                
                Button {
                    readyToAdd = true
                    getModelPhase = 2
                } label: {
                    Text("Continue without Customizing").padding(.all)
                }
                .buttonStyle(.borderedProminent)
                
            } else {
                
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
                
                ShareLink(item: bundleItem, label: {
                    Label("I'll print my template", systemImage: "square.and.arrow.up").padding(.all)
                })
                .buttonStyle(.borderedProminent)
            }
            
            Spacer()
        }
        
    }
}

struct TemplateDetail_Previews: PreviewProvider {
    static var previews: some View {
        TemplateDetail(id: 0)
    }
}
