//
//  SwitchPlayersPopUpView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 11/19/22.
//

import SwiftUI

struct SwitchPlayersPopUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var arViewModel : ARViewModel
    var body: some View {
        VStack {
            Text("Switch Players")
            Text("Time: \(arViewModel.gameTime)")
            Text("Score: \(arViewModel.score) out of 10")
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                GameButtonView(text: "Resume Game", color: Color.green, icon: "play")
            }

        }
    }
}

struct SwitchPlayersPopUpView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchPlayersPopUpView(arViewModel: ARViewModel.init())
    }
}
