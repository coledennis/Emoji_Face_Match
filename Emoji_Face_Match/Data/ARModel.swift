//
//  ARModel.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 10/30/22.
//

import Foundation
import RealityKit
import ARKit

struct ARModel {
    private(set) var arView : ARView
    
    var gameStageVar: GameStage = .menu
    
    var smileRight: Float = 0
    var smileLeft: Float = 0
    
    init() {
        arView = ARView(frame: .zero)
        arView.session.run(ARFaceTrackingConfiguration())
    }
    
    mutating func update(faceAnchor: ARFaceAnchor){
        smileRight = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .mouthSmileRight})?.value ?? 0)
        smileLeft = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .mouthSmileLeft})?.value ?? 0)
        checkToSeeIfSmile()
    }
    
    // Game Logic Below
    mutating func updateGameStage(gameStage: GameStage) {
        gameStageVar = gameStage
        print("Test 2 - gamestageVar = \(gameStageVar)")
    }
    
    
    
    mutating func checkToSeeIfSmile() {
        print("running func")
        if smileLeft > 0.3 || smileRight > 0.3 {
            gameStageVar = .ending
            print("should be changing to ending")
        }
    }
    // Game Logic Above
    
    
}
