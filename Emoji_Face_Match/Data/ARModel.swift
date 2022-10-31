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
    
    init() {
        arView = ARView(frame: .zero)
        arView.session.run(ARFaceTrackingConfiguration())
    }
    
    mutating func update(faceAnchor: ARFaceAnchor){
        
        // LIPS
        let smileRight = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .mouthSmileRight})?.value ?? 0)
        let smileLeft = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .mouthSmileLeft})?.value ?? 0)
        
        // EYES?
        
        
        // EYEBROWS
        
        
        // TOUNGE
        
        
        faceCheck(face: .Angry_face, smileLeft: smileLeft, smileRight: smileRight) // REMEMBER THAT THIS IS HARD CODED FOR ANGRY #######################
    }
    
    // Game Logic Below
    
    mutating func faceCheck(face: faces, smileLeft: Float, smileRight: Float) {
        if  smileLeft >= face.smileLeft.value {
            updateGameStage(gameStage: .ending)
        }
        
    }
    
    mutating func updateGameStage(gameStage: GameStage) {
        gameStageVar = gameStage
    }
    // Game Logic Above
    
    
}
