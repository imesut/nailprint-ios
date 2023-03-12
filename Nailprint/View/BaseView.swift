//
//  ContentView.swift
//  Nailprint
//
//  Created by Mesut Yılmaz on 12.03.2023.
//

import SwiftUI

let defaults = UserDefaults.standard

struct BaseView: View {
    var didOnboarded = defaults.bool(forKey: "isOnboarded")
    var body: some View {
        if(!didOnboarded){
            Onboarding()
        } else {
            TabsView()
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
