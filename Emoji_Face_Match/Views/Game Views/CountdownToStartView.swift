//
//  CountdownToStartView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 11/19/22.
//

import SwiftUI

struct CountdownToStartView: View {
    @AppStorage(StorageKeys.endingHighestScore.rawValue) var endingHighestScore: Int?
    @AppStorage(StorageKeys.endingLowestTime.rawValue) var endingLowestTime: Int?
    @ObservedObject var arViewModel : ARViewModel
    var body: some View {
        ZStack {
            ARViewContainer(arViewModel: arViewModel)
            Rectangle().fill(.thinMaterial)
            VStack(alignment: .center) {
                
                switch arViewModel.gameStage {
                case .singlePlayer:
                    Text("""
    Match your face to the emoji to collect points before the timer ends!
    
    Game starts in...
    """)
                    .font(.system(.title2, design: .rounded).bold())
                    .padding(.bottom)
                case .hotPotato:
                    Text("""
    Hand the device off to the next player as fast as possible between turns - the timer won't stop until the game ends!
    
    Collect 10 points to stop the clock and end the game!
    
    Game starts in...
    """)
                    .font(.system(.title2, design: .rounded).bold())
                    .padding(.bottom)
                default:
                    EmptyView()
                }
                
                Text(String(arViewModel.countdownTime))
                    .font(.system(.largeTitle, design: .rounded).bold())
                
                Button {
                    arViewModel.buttonHaptic()
                    arViewModel.changeGameStage(newGameStage: .menu)
                } label: {
                    GameButtonView(text: "Back To Menu", color: .gray, icon: "arrowshape.turn.up.backward")
                }
            }.padding(40)
        }.edgesIgnoringSafeArea(.all)
        
        
            .task {
                while arViewModel.countdownTime > 0  && arViewModel.gameStage == .singlePlayer || arViewModel.gameStage == .hotPotato { // SHOULD THIS LOGIC BE IN ARMODEL?
                    do {
                        print("test 1")
                        try await Task.sleep(nanoseconds: UInt64(1_000_000_000))
                        print("test 2")
                        if arViewModel.countdownTime > 0  && arViewModel.gameStage == .singlePlayer || arViewModel.gameStage == .hotPotato {
                            print("test 3")
                            arViewModel.countdownTimeUpdate()
                            if arViewModel.countdownTime > 0 {
                                print("test 4")
                                arViewModel.playCountdownAudio()
                            } else {
                                print("test 5")
                                arViewModel.playSuccessAudio()
                            }
                            arViewModel.buttonHaptic()
                        }
                        
                    } catch {
                        print ("error 3")
                    }
                }
            }
            .onAppear {
                arViewModel.prepareHaptics()
            }
    }
}

struct CountdownToStartView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownToStartView(arViewModel: ARViewModel.init())
    }
}
