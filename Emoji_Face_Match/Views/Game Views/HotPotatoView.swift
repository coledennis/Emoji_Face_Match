//
//  HotPotatoView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 11/19/22.
//

import SwiftUI

struct HotPotatoView: View {
    @ObservedObject var arViewModel : ARViewModel
    @State var switchPlayers = false
    var body: some View {
        CountToScoreGameView(arViewModel: arViewModel)
            .sheet(isPresented: $switchPlayers) {
                arViewModel.switchPlayerToggle()
            } content: {
                SwitchPlayersPopUpView(arViewModel: arViewModel)
            }
            .onChange(of: arViewModel.score) { newValue in
                if arViewModel.score < 10 {
                    switchPlayers = true
                }
            }
    }
}

struct HotPotatoView_Previews: PreviewProvider {
    static var previews: some View {
        HotPotatoView(arViewModel: ARViewModel.init())
    }
}
