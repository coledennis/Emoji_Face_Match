//
//  EndingView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 10/30/22.
//

import SwiftUI

struct EndingView: View {
    @AppStorage(StorageKeys.endingHighestScore.rawValue) var endingHighestScore: Int?
    @AppStorage(StorageKeys.endingLowestTime.rawValue) var endingLowestTime: Int?
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
                if arViewModel.gameStage == .ending {
                    //                Text("Score: \(arViewModel.score)")
                    Label("Score: \(arViewModel.score)", systemImage: "gamecontroller")
                        .font(.system(.largeTitle, design: .rounded).bold())
                    if arViewModel.score <= previousHighScore {
                        //                    Text("High Score: \(endingHighestScore ?? 0)")
                        Label("High Score: \(endingHighestScore ?? 0)", systemImage: "trophy")
                            .font(.system(.title3, design: .rounded).bold())
                    }
                    
                    if arViewModel.score > previousHighScore {
                        //                    Text("New High Score!")
                        Label("New High Score!", systemImage: "trophy")
                            .font(.system(.title2, design: .rounded).bold())
                            .foregroundColor(.yellow)
                        //                        .padding(.bottom)
                        Text("Previous High Score: \(previousHighScore)")
                            .font(.system(.title2, design: .rounded).bold())
                        //                        .foregroundColor(.green)
                        //                        .padding(.bottom)
                    }
                } else if arViewModel.gameStage == .countUpEnding {
                    Text("Time: \(arViewModel.gameTime) Seconds")  .font(.system(.largeTitle, design: .rounded).bold())
                    //                    .padding(.bottom)
                    if endingLowestTime != nil {
                        if arViewModel.gameTime >= previousHighScore {
                            Text("High Score: \(endingLowestTime!) Seconds")
                                .font(.system(.title3, design: .rounded).bold())
                        }
                    }
                    if arViewModel.gameTime < previousHighScore {
                        Text("New High Score!")
                            .font(.system(.title2, design: .rounded).bold())
                            .foregroundColor(.yellow)
                        //                        .padding(.bottom)
                        if endingLowestTime != nil && previousHighScore != 999 {
                            Text("Previous High Score: \(previousHighScore)")
                                .font(.system(.title2, design: .rounded).bold())
                            //                        .foregroundColor(.green)
                        }
                    }
                }
                
                Button {
                    arViewModel.buttonHaptic()
                    arViewModel.changeGameStage(newGameStage: .menu)
                } label: {
                    GameButtonView(text: "Back to Menu", color: .primary, icon: "arrowshape.turn.up.left")
                }
            }
            .onAppear {
                if arViewModel.gameStage == .ending {
                    previousHighScore = endingHighestScore ?? 0
                    if arViewModel.score > previousHighScore {
                        endingHighestScore = arViewModel.score
                    }
                }
                else if arViewModel.gameStage == .countUpEnding {
                    previousHighScore = endingLowestTime ?? 999
                    if arViewModel.gameTime < previousHighScore {
                        endingLowestTime = arViewModel.gameTime
                    }
                }
                arViewModel.prepareHaptics()
                arViewModel.endingHaptic()
                arViewModel.playEndingAudio()
                arViewModel.toggleGameActiveFalse()
            }
        }
    }
}

struct EndingView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView(arViewModel: ARViewModel.init())
    }
}
