//
//  ARViewModel.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 10/30/22.
//

import Foundation
import RealityKit
import ARKit

class ARViewModel: UIViewController, ObservableObject, ARSessionDelegate {
    @Published var model : ARModel = ARModel()
    
    var arView : ARView {
        model.arView
    }
    
    // Game Logic Below
    var gameStage: GameStage {
        model.gameStageVar
    }
    
    func changeGameStage(newGameStage: GameStage) {
        model.updateGameStage(gameStage: newGameStage)
    }
    
    // Game Logic Above
    
    
    var isSmiling: Bool {
        var temp = false
        if model.smileLeft > 0.3 || model.smileRight > 0.3 {
            temp = true
        }
        return temp
    }
    
    func startSessionDelegate() {
        model.arView.session.delegate = self
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        if let faceAnchor = anchors.first  as? ARFaceAnchor {
            model.update(faceAnchor: faceAnchor)
        }
    }
    
}
