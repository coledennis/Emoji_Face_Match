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
    @State var frameSize: CGFloat = 100
    var body: some View {
        ZStack {
            ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
            topBar
            VStack {
                if arViewModel.model.facesArray.count > 0 {
                    arViewModel.model.facesArray.first?.image
                        .resizable()
                        .frame(width: frameSize, height: frameSize)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25).fill(.regularMaterial))
                        .onTapGesture {
                            changeEmoji()
                        }
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
                        arViewModel.playEndingAudio()
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
    
    func changeEmoji() {
        simpleSuccess()
        arViewModel.shuffle()
        withAnimation(.spring(dampingFraction: 0.5)) {
            frameSize = 130
        }
        Task {
            do {
                try await Task.sleep(nanoseconds: UInt64(0_200_000_000))
                withAnimation(.spring(dampingFraction: 0.5)) {
                    frameSize = 100
                }
            } catch {
                print ("error")
            }
        }
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}

struct SinglePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayerView(arViewModel: ARViewModel.init())
    }
}
