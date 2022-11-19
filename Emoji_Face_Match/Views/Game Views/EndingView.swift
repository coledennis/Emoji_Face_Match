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
            ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
            Rectangle().fill(.thinMaterial).edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 5, alignment: .center)]) {
                        ForEach(arViewModel.model.collectedFaces, id: \.self) { face in
                            face.image
                                .resizable()
                                .frame(width: 100, height: 100)
                                .onTapGesture {
                                    arViewModel.buttonHaptic()
                                }
                        }
                    }
                }
                .padding()
                Text("Score: \(arViewModel.score)")  .font(.system(.largeTitle, design: .rounded).bold())
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
        }
    }
}

struct EndingView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView(arViewModel: ARViewModel.init())
    }
}
