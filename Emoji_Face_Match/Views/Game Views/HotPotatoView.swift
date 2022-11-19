//
//  HotPotatoView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 11/19/22.
//

import SwiftUI

struct HotPotatoView: View {
    @ObservedObject var arViewModel : ARViewModel
    var body: some View {
        CountToScoreGameView(arViewModel: arViewModel)
    }
}

struct HotPotatoView_Previews: PreviewProvider {
    static var previews: some View {
        HotPotatoView(arViewModel: ARViewModel.init())
    }
}
