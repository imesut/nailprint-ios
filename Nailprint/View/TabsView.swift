//
//  TabsView.swift
//  Nailprint
//
//  Created by Mesut Yılmaz on 12.03.2023.
//

import SwiftUI

struct TabsView: View {
    
    init() {
        defaults.set(true, forKey: "isOnboarded")
    }
    
    var body: some View {
        NavigationView{
            TabView {
                TemplatesTab().tabItem {
                    Label("Templates", systemImage: "squareshape.squareshape.dashed") }.tag(1)
                TipsTab().tabItem { Label("Tips and Tricks", systemImage: "lightbulb") }.tag(2)
            }
        }
        .navigationBarHidden(true)
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
