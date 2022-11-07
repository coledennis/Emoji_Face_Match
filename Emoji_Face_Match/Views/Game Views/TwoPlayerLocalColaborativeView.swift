//
//  TwoPlayerLocalColaborativeView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 11/6/22.
//

import SwiftUI

struct TwoPlayerLocalCollaborativeView: View {
    @ObservedObject var arViewModel : ARViewModel
    var body: some View {
        GenericGameView(arViewModel: arViewModel)
    }
}

struct TwoPlayerLocalColaborativeView_Previews: PreviewProvider {
    static var previews: some View {
        TwoPlayerLocalCollaborativeView(arViewModel: ARViewModel.init())
    }
}
