//
//  Onboarding.swift
//  Nailprint
//
//  Created by Mesut Yılmaz on 12.03.2023.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                
                Text("Welcome to Nailprint!")
                    .font(.largeTitle)
                    .padding(.all)
                
                Text("An app to choose templates for your untemplatable beauty.").multilineTextAlignment(.center)
                    .padding(.all)
                    .padding(.horizontal)
                
                Text("Discover templates for nail polishing, nail art and more. With an addition of accessible makeup & personal care tips and tricks.")
                    .multilineTextAlignment(.center)
                    .padding(.all)
                    .padding(.horizontal)
                
                Spacer()
                
                Image("nail_drawing")
                    .resizable()
                    .scaledToFit()
                    .padding(.all)
                    .accessibilityLabel("A coloured single-line illustration about nail polishing")
                
                NavigationLink(destination: TabsView()){
                    Text("Continue")
                        .padding(.all)
                        .padding(.horizontal)
                }
                .buttonStyle(.borderedProminent)
                
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
