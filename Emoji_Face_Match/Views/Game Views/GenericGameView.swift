//
//  GenericGameView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 11/6/22.
//

import SwiftUI

struct GenericGameView: View {
    @ObservedObject var arViewModel : ARViewModel
    @State var frameSize: CGFloat = 100
    var body: some View {
        ZStack {
            ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
            topBar
            currentEmoji
                .padding(5)
//            testingData
        }
        .onAppear {
            arViewModel.gameActiveToggle()
            arViewModel.prepareHaptics()
        }
        .task {
            while arViewModel.gameTime > 0 && arViewModel.isGameActive { // SHOULD THIS LOGIC BE IN ARMODEL?
                do {
                    try await Task.sleep(nanoseconds: UInt64(1_000_000_000))
                    arViewModel.updateGameTime()
                    
                    if arViewModel.gameTime < 6 && arViewModel.gameTime > 0 {
                        arViewModel.playCountdownAudio()
                        arViewModel.buttonHaptic()
                    }
                    
                    if arViewModel.gameTime == 0 {
                        arViewModel.gameActiveToggle()
                        arViewModel.changeGameStage(newGameStage: .ending)
                    }
                } catch {
                    print ("error 1")
                }
            }
        }
    }
    
    var topBar: some View {
        VStack {
            HStack {
                Label(String(arViewModel.score), systemImage: "trophy")
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial))
                Spacer()
                Label(String(arViewModel.gameTime), systemImage: "clock")
                    .padding()
                    .foregroundColor(arViewModel.gameTime > 5 ? Color(uiColor: .label) : .red)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial))
            }
            .padding(.horizontal)
            Spacer()
            
            HStack {
                Spacer()
                Button {
                    arViewModel.buttonHaptic()
                    arViewModel.changeGameStage(newGameStage: .menu)
                } label: {
                    Label(String("Menu"), systemImage: "arrowshape.turn.up.backward")
                        .padding()
                        .foregroundColor(.primary)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial))
                }
            }
        }.font(.subheadline.weight(.bold))
        .padding(5)
    }
    
    var currentEmoji: some View {
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
    }
    
    func changeEmoji() {
        arViewModel.simpleSuccess()
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
    
//    var testingData: some View {
//        VStack {
//            Spacer()
//            VStack {
//                Text("Eyes: \(arViewModel.eyeStatus.string)")
//                Text("Eyebrows: \(arViewModel.eyebrowStatus.string)")
//                Text("Mouth: \(arViewModel.mouthStatus.string)")
//            }
//            .background(RoundedRectangle(cornerRadius: 10).fill(.regularMaterial))
//
//        }
//    }
}

struct GenericGameView_Previews: PreviewProvider {
    static var previews: some View {
        GenericGameView(arViewModel: ARViewModel.init())
    }
}
