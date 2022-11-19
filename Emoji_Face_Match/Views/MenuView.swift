//
//  MenuView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 10/30/22.
//

import SwiftUI

struct MenuView: View {
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
                Text("Emoji Face Match Party")
                    .font(.system(.largeTitle, design: .rounded).bold())
                Text("Party Game You Play With Your FACE!")
                    .font(.system(.subheadline, design: .rounded).bold())
                
                ForEach(GameStage.allCases, id: \.self) { gameStage in
                    if gameStage != GameStage.menu && gameStage != GameStage.ending && gameStage != GameStage.twoPlayerCompetitiveLocal && gameStage != GameStage.countUpEnding {
                        gameButton(gameStage: gameStage, text: gameStage.string, color: gameStage.color, icon: gameStage.icon)
                    }
                }
            }
            
        }.edgesIgnoringSafeArea(.all)
    }
    
    func gameButton(gameStage: GameStage, text: String, color: Color, icon: String) -> some View {
        Button {
            arViewModel.buttonHaptic()
            arViewModel.changeGameStage(newGameStage: gameStage)
            if gameStage == .singlePlayer || gameStage == .twoPlayerCollaborativeLocal {
                arViewModel.gameSetup()
            } else {
                arViewModel.countUpGameSetup()
            }
        } label: {
            GameButtonView(text: text, color: color, icon: icon)
        }
    }
    
    func changeEmoji() {
//        arViewModel.softHaptic()
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
