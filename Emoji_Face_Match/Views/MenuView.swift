//
//  MenuView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 10/30/22.
//

import SwiftUI

struct MenuView: View {
//    @AppStorage(StorageKeys.endingHighestScore.rawValue) var endingHighestScore: Int?
//    @AppStorage(StorageKeys.endingLowestTime.rawValue) var endingLowestTime: Int?
    @ObservedObject var arViewModel : ARViewModel
    @State var backgroundImage: Image?
    @State var frameSize: CGFloat = 100
    var body: some View {
        ZStack {
            ARViewContainer(arViewModel: arViewModel)
                .onAppear {
                    backgroundImage = arViewModel.facesArray.randomElement()?.image
                }
            Rectangle().fill(.thinMaterial)
            VStack {
                backgroundImage?
                    .resizable()
                    .frame(width: frameSize, height: frameSize)
                    .onTapGesture {
                        changeEmoji()
                    }
                Text("Emoji Face Match")
                    .font(.system(.largeTitle, design: .rounded).bold())
                Text("Games You Play With Your FACE!")
                    .font(.system(.subheadline, design: .rounded).bold())
                    .padding(.bottom, 5)
                
                ForEach(GameStage.allCases, id: \.self) { gameStage in
                    switch gameStage {
                    case .singlePlayer, .hotPotato, .tutorial:  gameButton(gameStage: gameStage, text: gameStage.string, color: gameStage.color, icon: gameStage.icon)
                            .padding(5)
//                        if gameStage == .singlePlayer {
//                            if endingHighestScore != nil {
//                                Text("Single Player High Score: \(String(Int(endingHighestScore!)))")
//                                    .foregroundColor(gameStage.color)
//                                    .font(.system(.body, design: .rounded).bold())
//                            } else {
//                                Text("No Single Player High Score - Yet!")
//                                    .foregroundColor(gameStage.color)
//                                    .font(.system(.body, design: .rounded).bold())
//                            }
//                        }
//                        if gameStage == .hotPotato {
//                            if endingLowestTime != nil {
//                                Text("Single Player High Score: \(String(Int(endingLowestTime!)))")
//                                    .foregroundColor(gameStage.color)
//                                    .font(.system(.body, design: .rounded).bold())
//                            } else {
//                                Text("No Hot Potato High Score - Yet!")
//                                    .foregroundColor(gameStage.color)
//                                    .font(.system(.body, design: .rounded).bold())
//                            }
//                        }
//                        
                    default: EmptyView()
                    }
                }
            }
            
        }.edgesIgnoringSafeArea(.all)
    }
    
    func gameButton(gameStage: GameStage, text: String, color: Color, icon: String) -> some View {
        Button {
            arViewModel.buttonHaptic()
            arViewModel.changeGameStage(newGameStage: gameStage)
            switch gameStage {
            case .singlePlayer: arViewModel.gameSetup()
            case .hotPotato: arViewModel.countUpGameSetup()
            case .menu:
                break
            case .ending:
                break
            case .countUpEnding:
                break
            case .tutorial:
                break
            }
        } label: {
            GameButtonView(text: text, color: color, icon: icon)
        }
    }
    
    func changeEmoji() {
        arViewModel.buttonHaptic()
        backgroundImage = arViewModel.facesArray.randomElement()?.image
        withAnimation(.spring(dampingFraction: 0.5)) {
            frameSize = 130
        }
        Task {
            do {
                try await Task.sleep(nanoseconds: UInt64(0_200_000_000))
                withAnimation(.spring(dampingFraction: 0.5)) {
                    frameSize = 100
                }
                arViewModel.buttonHaptic()
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


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(arViewModel: ARViewModel.init())
    }
}
