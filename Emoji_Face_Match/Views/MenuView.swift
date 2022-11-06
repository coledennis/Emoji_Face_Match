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
    var body: some View {
        ZStack {
            LazyVGrid(columns: [GridItem.init(.adaptive(minimum: 20), spacing: 60)]) {
                ForEach(1...100, id: \.self) { face in
                   backgroundImage
                }
            }
            .onAppear {
                backgroundImage = arViewModel.facesArray.randomElement()?.image
            }
            .blur(radius: 6)
            .opacity(0.07)
            VStack {
                backgroundImage
                Text("Emoji Face Match Party")
                    .font(.system(.largeTitle, design: .rounded, weight: .bold))
                Text("AR Party Game You Play With Your FACE!")
                    .font(.system(.subheadline, design: .rounded, weight: .bold))
                
                ForEach(GameButtons.allCases, id: \.self) { button in
                    gameButton(gameStage: button.gameStage, text: button.string, color: button.color, icon: button.icon)
                }
            }
        }
    }
    
    func gameButton(gameStage: GameStage, text: String, color: Color, icon: String) -> some View {
        Button {
            arViewModel.changeGameStage(newGameStage: gameStage)
        } label: {
            GameButtonView(text: text, color: color, icon: icon)
        }
    }
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(arViewModel: ARViewModel.init())
    }
}
