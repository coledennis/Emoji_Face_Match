//
//  MenuView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 10/30/22.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var arViewModel : ARViewModel
    var body: some View {
        VStack {
            HStack {
//                Image(systemName: "face.dashed")
//                    .font(.largeTitle)
                Image("Anguished face")
            }
            Text("Emoji Face Match Party")
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
            Button {
                arViewModel.changeGameStage(newGameStage: .singlePlayer)
            } label: {
                GameButtonView(text: "1 Player - Start", color: .red, icon: "person")
            }
            Button {
                arViewModel.changeGameStage(newGameStage: .singlePlayer)
            } label: {
                GameButtonView(text: "2 Player - Competitive", color: .orange, icon: "person.2")
            }
            Button {
                arViewModel.changeGameStage(newGameStage: .singlePlayer)
            } label: {
                GameButtonView(text: "2 Player - Collaborative", color: .green, icon: "person.2")
            }
            Button {
                arViewModel.changeGameStage(newGameStage: .singlePlayer)
            } label: {
                GameButtonView(text: "Party Mode", color: .blue, icon: "person.2")
            } // GENERALIZE THIS TO REDUCE CODE
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(arViewModel: ARViewModel.init())
    }
}
