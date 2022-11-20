//
//  MenuView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 10/30/22.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @ObservedObject var arViewModel : ARViewModel
    @State var backgroundImage: Image?
    @State var frameSize: CGFloat = 100
    var body: some View {
        ZStack {
            ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
                .onAppear {
                    backgroundImage = arViewModel.facesArray.randomElement()?.image
                }
            Rectangle().fill(.thinMaterial).edgesIgnoringSafeArea(.all)
                switch verticalSizeClass {
                case .compact:
                    VStack {
                        Text("Match the 'Moji")
                            .font(.system(.largeTitle, design: .rounded).bold())
                        Text("Games You Play With Your FACE!")
                            .font(.system(.subheadline, design: .rounded).bold())
//                            .padding(.bottom, 5)
                        HStack {
                            backgroundImage?
                                .resizable()
                                .frame(width: frameSize*2, height: frameSize*2)
                                .onTapGesture {
                                    changeEmoji()
                                }
                            VStack {
                                ForEach(GameStage.allCases, id: \.self) { gameStage in
                                    switch gameStage {
                                    case .singlePlayer, .hotPotato, .tutorial:  gameButton(gameStage: gameStage, text: gameStage.string, color: gameStage.color, icon: gameStage.icon)
                                            .padding(5)
                                    default: EmptyView()
                                    }
                                }
                            }
                        }
                    }
                default:
                    VStack {
                        backgroundImage?
                            .resizable()
                            .frame(width: frameSize*1.5, height: frameSize*1.5)
                            .onTapGesture {
                                changeEmoji()
                            }
                        Text("Match the 'Moji")
                            .font(.system(.largeTitle, design: .rounded).bold())
                        Text("Games You Play With Your FACE!")
                            .font(.system(.subheadline, design: .rounded).bold())
//                            .padding(.bottom, 5)
                        
                        ForEach(GameStage.allCases, id: \.self) { gameStage in
                            switch gameStage {
                            case .singlePlayer, .hotPotato, .tutorial:  gameButton(gameStage: gameStage, text: gameStage.string, color: gameStage.color, icon: gameStage.icon)
                                    .padding(5)
                            default: EmptyView()
                            }
                        }
                    }
                }
//            }
        }
    }
    
    func gameButton(gameStage: GameStage, text: String, color: Color, icon: String) -> some View {
        Button {
            arViewModel.buttonHaptic()
            arViewModel.changeGameStage(newGameStage: gameStage)
            arViewModel.gameSetup()
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
