//
//  SinglePlayerView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 10/30/22.
//

import SwiftUI

struct SinglePlayerView: View {
    @ObservedObject var arViewModel : ARViewModel
    @State var switchPlayers = false
    var body: some View {
        if arViewModel.countdownTime > 0 {
            CountdownToStartView(arViewModel: arViewModel)
        } else {
            if arViewModel.gameStage == .singlePlayer {
                GenericGameView(arViewModel: arViewModel)
                    .onAppear {
                        arViewModel.toggleGameActiveTrue()
                    }
            } else if arViewModel.gameStage == .hotPotato {
                GenericGameView(arViewModel: arViewModel)
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
                    .onAppear {
                        arViewModel.toggleGameActiveTrue()
                    }
            }
        }
    }
}

struct SinglePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayerView(arViewModel: ARViewModel.init())
    }
}
