//
//  CountToScoreGameView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 11/19/22.
//

import SwiftUI

struct CountToScoreGameView: View {
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
            while arViewModel.isGameActive { // SHOULD THIS LOGIC BE IN ARMODEL?
                do {
                    if arViewModel.score > 9 {
                        arViewModel.gameActiveToggle()
                        arViewModel.changeGameStage(newGameStage: .countUpEnding)
                    }
                    
                    try await Task.sleep(nanoseconds: UInt64(1_000_000_000))
                    arViewModel.countUpGameTime()
                
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
                    
//                    .bold()
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial))
                Spacer()
                Label(String(arViewModel.gameTime), systemImage: "clock")
//                    .bold()
                    .padding()
                    .foregroundColor(arViewModel.gameTime < 60 ? Color(uiColor: .label) : .red)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial))
            }
            .padding(.horizontal)
            Spacer()
            
            HStack {
                Spacer()
                Button {
                    arViewModel.buttonHaptic()
                    arViewModel.changeGameStage(newGameStage: .menu)
                    //
                } label: {
                    Label(String("Menu"), systemImage: "arrowshape.turn.up.backward")
//                        .bold()
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
    
    var testingData: some View {
        VStack {
            Spacer()
            VStack {
//                Text("Eyes: \(arViewModel.eyeStatus.string)")
//                Text("Eyebrows: \(arViewModel.eyebrowStatus.string)")
//                Text("Mouth: \(arViewModel.mouthStatus.string)")
            }
            .background(RoundedRectangle(cornerRadius: 10).fill(.regularMaterial))
            
        }
    }
}

struct CountToScoreGameView_Previews: PreviewProvider {
    static var previews: some View {
        CountToScoreGameView(arViewModel: ARViewModel.init())
    }
}
