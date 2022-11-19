//
//  SinglePlayerView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 10/30/22.
//

import SwiftUI

struct SinglePlayerView: View {
    @ObservedObject var arViewModel : ARViewModel
    var body: some View {
        if arViewModel.countdownTime > 0 {
            CountdownToStartView(arViewModel: arViewModel)
        } else {
            GenericGameView(arViewModel: arViewModel)
        }
    }
}

struct SinglePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayerView(arViewModel: ARViewModel.init())
    }
}
