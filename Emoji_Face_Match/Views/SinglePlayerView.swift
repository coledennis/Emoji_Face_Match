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
                HStack {
                    Label(String(arViewModel.score), systemImage: "trophy")
                        .bold()
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial))
                    Spacer()
                    Label("00:15", systemImage: "clock")
                        .bold()
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial))
                }
                .padding(.horizontal)
                Spacer()
                
            }
            .padding(5)
            // break this out into a separate view / variable
            VStack {
                VStack {
                    if arViewModel.model.facesArray.count > 0 {
                        arViewModel.model.facesArray.first?.image
                    }
//                    faces.Angry_face.image
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).fill(.regularMaterial))
                Spacer()
            }
            .padding(5)
        }
    }
}

struct SinglePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayerView(arViewModel: ARViewModel.init())
    }
}
