//
//  SinglePlayerView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 10/30/22.
//

import SwiftUI

struct SinglePlayerView: View {
    @State private var timeRemaining = 15
    @ObservedObject var arViewModel : ARViewModel
    var body: some View {
        ZStack {
            ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
            topBar
            VStack {
                    if arViewModel.model.facesArray.count > 0 {
                        arViewModel.model.facesArray.first?.image
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 25).fill(.regularMaterial))
                    }
                Spacer()
            }
            .padding(5)
            
//            VStack {
//                Spacer()
//                VStack {
//                    Text("Eyes: \(arViewModel.eyeStatus.string)")
//                    Text("Eyebrows: \(arViewModel.eyebrowStatus.string)")
//                    Text("Mouth: \(arViewModel.mouthStatus.string)")
//                }
//                .bold()
//                .background(RoundedRectangle(cornerRadius: 10).fill(.regularMaterial))
//
//            } // Only for testing purposes
        }
        .task {
            while timeRemaining > 0 {
                do {
                    try await Task.sleep(nanoseconds: UInt64(1_000_000_000))
                    timeRemaining -= 1
                    if timeRemaining == 0 {
                        arViewModel.changeGameStage(newGameStage: .ending)
                    }
                } catch {
                    print ("error")
                }
            }
        }
    }
    
    var topBar: some View {
        VStack {
            HStack {
                Label(String(arViewModel.score), systemImage: "trophy")
                    .bold()
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial))
                Spacer()
                Label(String(timeRemaining), systemImage: "clock")
                    .bold()
                    .padding()
                    .foregroundColor(timeRemaining > 5 ? Color(uiColor: .label) : .red)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial))
            }
            .padding(.horizontal)
            Spacer()
            
        }
        .padding(5)
    }
    
}

struct SinglePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayerView(arViewModel: ARViewModel.init())
    }
}
