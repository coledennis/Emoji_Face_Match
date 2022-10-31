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
                ZStack {
                    ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
                    VStack {
                        Text(arViewModel.isSmiling ? "Smiling 😄" : "Not Smiling 😐")
                            .padding()
                            .foregroundColor(arViewModel.isSmiling ? .green : .red)
                            .background(RoundedRectangle(cornerRadius: 25).fill(.regularMaterial))
                        Spacer()
                    }
                }
    }
}

struct SinglePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayerView(arViewModel: ARViewModel.init())
    }
}
