//
//  ContentView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 10/30/22.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @ObservedObject var arViewModel : ARViewModel = ARViewModel()
    var body: some View {
        VStack {
            switch arViewModel.gameStage {
            case .menu: MenuView(arViewModel: arViewModel)
            case .singlePlayer, .hotPotato: SinglePlayerView(arViewModel: arViewModel)
            case .ending, .countUpEnding: EndingView(arViewModel: arViewModel)
            case .tutorial:
                TutorialView(arViewModel: arViewModel)
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    var arViewModel: ARViewModel
    func makeUIView(context: Context) -> ARView {
        arViewModel.startSessionDelegate()
        return arViewModel.arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
