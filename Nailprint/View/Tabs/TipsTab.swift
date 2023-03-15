//
//  TipsTab.swift
//  Nailprint
//
//  Created by Mesut Yılmaz on 12.03.2023.
//

import SwiftUI
import AVFoundation
let speechSynthesizer = AVSpeechSynthesizer()

struct TipsTab: View {
    @State var showAlert = false
    @State var showSheet = false
    @State var itemToShow : Int = 0
    
    var body: some View {
        
        List{
            Section {
                ForEach(TipsAndTricks, id: \.id){ tip in
                    VStack (alignment: .leading){
                        Text(tip.title).bold()
                        HStack {
//                            Text(tip.description).lineLimit(1)
//                            Spacer()
                            Text("by " + tip.author).italic()
                            Image("chevron.forward")
                        }.padding(.bottom, 6).padding(.top, 4)
                    }
                    .onTapGesture {
                        showSheet = true
                        itemToShow = tip.id
                    }
                }
            } header: {
                Text("Tips & Tricks").font(.title).padding(.vertical)
            }
        }
        .sheet(isPresented: $showSheet) {
            sheetView(tip: TipsAndTricks[itemToShow])
        }
    }
}

struct sheetView : View {
    @Environment(\.dismiss) var dismiss
    
    init(tip: TipsAndTrick) {
        self.tip = tip
    }
    var tip : TipsAndTrick
    var body: some View {
        ScrollView {
            VStack (spacing: 24){
                Button(action: {
                    dismiss()
                }) {
                    Label("Dismiss", systemImage: "chevron.down")
                }
                Text(tip.title).font(.title)
                HStack{
                    Text(tip.date).italic()
                    Text("by").italic()
                    Text(tip.author).italic()
                }

                VStack{
                    Button {
                        readAloud(text: tip.title + "\n\n" + tip.description)
                    } label: {
                        Label("Read Aloud", systemImage: "speaker.wave.2").padding(.all)
                    }.buttonStyle(.borderedProminent)
                    
                    Button {
                        stopReading()
                    } label: {
                        Label("Stop Reading", systemImage: "stop").padding(.vertical)
                    }
                }
                
                Text(tip.description)
                    .lineSpacing(6)
                
            }.padding(.all, 24)
        }
    }
}

func readAloud(text : String){
    stopReading()
    let utterance = AVSpeechUtterance(string: text)
    utterance.pitchMultiplier = 1.0
    utterance.rate = 0.5
    utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
    speechSynthesizer.speak(utterance)
}

func stopReading(){
    if speechSynthesizer.isSpeaking{
        speechSynthesizer.stopSpeaking(at: .immediate)
    }
}

struct TipsTab_Previews: PreviewProvider {
    static var previews: some View {
        TipsTab()
//            .previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus"))
    }
}
