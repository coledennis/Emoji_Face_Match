//
//  EndingView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 10/30/22.
//

import SwiftUI

struct EndingView: View {
    @ObservedObject var arViewModel : ARViewModel
    var body: some View {
        ZStack {
            ARViewContainer(arViewModel: arViewModel)
            Rectangle().fill(.thinMaterial)
            VStack {
                Text("Score: \(arViewModel.score)")  .font(.system(.headline, design: .rounded).bold())
                    .padding(.bottom)
                    
                Button {
                    arViewModel.buttonHaptic()
                    arViewModel.changeGameStage(newGameStage: .menu)
                } label: {
                    GameButtonView(text: "Back to Menu", color: .primary, icon: "arrowshape.turn.up.left")
                }
            }
            .onAppear {
                arViewModel.prepareHaptics()
                arViewModel.endingHaptic()
                arViewModel.playEndingAudio()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct EndingView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView(arViewModel: ARViewModel.init())
    }
}
