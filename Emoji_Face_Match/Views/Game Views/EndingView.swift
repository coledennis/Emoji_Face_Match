//
//  EndingView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 10/30/22.
//

import SwiftUI

struct EndingView: View {
    @AppStorage(StorageKeys.endingHighestScore.rawValue) var endingHighestScore: Int?
    @ObservedObject var arViewModel : ARViewModel
    @State var previousHighScore = 0
    var body: some View {
        ZStack {
            ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
            Rectangle().fill(.thinMaterial).edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 5, alignment: .center)]) {
                        ForEach(arViewModel.model.collectedFaces, id: \.self) { face in
                            face.image
                                .resizable()
                                .frame(width: 100, height: 100)
                                .onTapGesture {
                                    arViewModel.buttonHaptic()
                                }
                        }
                    }
                }
                .padding()
                Text("Score: \(arViewModel.score)")
                    .font(.system(.largeTitle, design: .rounded).bold())
                if arViewModel.score <= previousHighScore {
                    Text("High Score: \(endingHighestScore ?? 0)")
                    .font(.system(.title3, design: .rounded).bold())
                }
                   
                if arViewModel.score > previousHighScore {
                    Text("New High Score!")
                        .font(.system(.title2, design: .rounded).bold())
                        .foregroundColor(.green)
//                        .padding(.bottom)
                    Text("Previous High Score: \(previousHighScore)")
                        .font(.system(.title2, design: .rounded).bold())
//                        .foregroundColor(.green)
//                        .padding(.bottom)
                }
                
                Button {
                    arViewModel.buttonHaptic()
                    arViewModel.changeGameStage(newGameStage: .menu)
                } label: {
                    GameButtonView(text: "Back to Menu", color: .primary, icon: "arrowshape.turn.up.left")
                }
            }
            .onAppear {
                print("old endingHighestScore = \(endingHighestScore)")
                previousHighScore = endingHighestScore ?? 0
                arViewModel.prepareHaptics()
                arViewModel.endingHaptic()
                arViewModel.playEndingAudio()
                if arViewModel.score > endingHighestScore ?? 0 {
                    endingHighestScore = arViewModel.score
                    print("new endingHighestScore = \(endingHighestScore)")
                }
            }
        }
    }
}

struct EndingView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView(arViewModel: ARViewModel.init())
    }
}
