//
//  TemplatesTab.swift
//  Nailprint
//
//  Created by Mesut Yılmaz on 12.03.2023.
//

import SwiftUI

struct TemplatesTab: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("NAILPRINT")
                .font(.largeTitle)
                .padding(.top, 48)
                .padding(.horizontal)
                
            Text("Here are some templates for you.").padding(.horizontal)
            
            List(Templates, id: \.id) { template in
                NavigationLink {
                    TemplateDetail(id: template.id)
                } label: {
                    VStack(alignment: .leading, spacing: 8){
                        HStack{
                            Text(template.name).font(.headline)
                            if (template.active) {
                                Spacer()
                                Image("chevron.right")
                            }
                        }
                        Text(template.description).font(.callout).lineLimit(2)
                    }
                }
                .disabled(!template.active)
            }.listStyle(.sidebar)
                .scrollContentBackground(.hidden)
        }
        .background(Color(.systemGray6))
    }
}

struct TemplatesTab_Previews: PreviewProvider {
    static var previews: some View {
        TemplatesTab()
    }
}
