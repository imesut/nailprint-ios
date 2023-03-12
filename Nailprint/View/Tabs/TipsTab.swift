//
//  TipsTab.swift
//  Nailprint
//
//  Created by Mesut Yılmaz on 12.03.2023.
//

import SwiftUI

struct TipsTab: View {
    @State var showAlert = false
    @State var itemToShow : Int = 0
    
    var body: some View {
        
        List{
            Section {
                ForEach(TipsAndTricks, id: \.id){ tip in
                    VStack (alignment: .leading){
                        Text(tip.title).bold()
                        HStack(spacing: 4) {
                            Text(tip.description).lineLimit(1)
                            Spacer()
                            Text("by " + tip.author).italic()
                        }.padding(.bottom, 6).padding(.top, 4)
                    }
                    .onTapGesture {
                        showAlert = true
                        itemToShow = tip.id
                    }
                }
            } header: {
                Text("Tips & Tricks").font(.title).padding(.vertical)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(TipsAndTricks[itemToShow].title),
                  message: Text(TipsAndTricks[itemToShow].description + "\n\n by: " + TipsAndTricks[itemToShow].author))
        }
    }
}

struct TipsTab_Previews: PreviewProvider {
    static var previews: some View {
        TipsTab()
    }
}
