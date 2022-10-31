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
                VStack {
                    faces.Angry_face.image
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).fill(.regularMaterial))
                Spacer()
                
                VStack {
                    Text("Points: 0")
                    Text("Timer: 0:15")
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).fill(.regularMaterial))
            }
        }
    }
}

struct SinglePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayerView(arViewModel: ARViewModel.init())
    }
}
