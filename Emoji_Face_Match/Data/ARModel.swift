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
    
    var currentScore: Int = 0
    
    var facesArray: Array<faces> = [.Angry_face, .Clown_face]
    
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
        
        if facesArray.count > 0 {
            faceCheck(face: facesArray.first!, smileLeft: smileLeft, smileRight: smileRight) // REMEMBER THAT THIS IS HARD CODED FOR ANGRY #######################
        }
    }
    
    // Game Logic Below
    
    mutating func faceCheck(face: faces, smileLeft: Float, smileRight: Float) {
        if  smileLeft >= face.smileLeft.value {
            //            updateGameStage(gameStage: .ending)
            if face == facesArray.first {
                currentScore += 1
                facesArray.remove(at: 0)
            }
            
        }
    }
    
    mutating func updateGameStage(gameStage: GameStage) {
        gameStageVar = gameStage
    }
    // Game Logic Above
    
    
}
