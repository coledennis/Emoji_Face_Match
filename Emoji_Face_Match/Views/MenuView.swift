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
            Image("Anguished face")
            Text("Emoji Face Match")
                .font(.largeTitle)
            
            Button {
                arViewModel.changeGameStage(newGameStage: .singlePlayer)
            } label: {
                Text("1 Player - Start")
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(arViewModel: ARViewModel.init())
    }
}
