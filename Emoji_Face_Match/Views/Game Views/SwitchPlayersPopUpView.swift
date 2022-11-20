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
            Text("Switch Players!")
                .font(.system(.largeTitle, design: .rounded).bold())
                .padding(.bottom)
            Text("Time: \(arViewModel.gameTime)")
                .font(.system(.title3, design: .rounded).bold())
                .padding(.bottom)
            Text("Round \(arViewModel.score) out of 10")
                .font(.system(.title3, design: .rounded).bold())
                .padding(.bottom)
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                GameButtonView(text: "Next Player Ready", color: Color.green, icon: "play")
            }

        }
    }
}

struct SwitchPlayersPopUpView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchPlayersPopUpView(arViewModel: ARViewModel.init())
    }
}
