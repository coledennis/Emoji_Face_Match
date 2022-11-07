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
    
    
    // MARK: AR Setup
    @Published var model : ARModel = ARModel()
    
    var arView : ARView {
        model.arView
    }
    
    func startSessionDelegate() {
        model.arView.session.delegate = self
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        
        if model.isGameActive {
            
            if let faceAnchor = anchors.first  as? ARFaceAnchor {
                model.update(faceAnchor: faceAnchor)
            }
        }
    }
    
    // MARK: Game Setup
    var gameStage: GameStage {
        model.gameStageVar
    }
    
    func changeGameStage(newGameStage: GameStage) {
        model.updateGameStage(gameStage: newGameStage)
    }
    
    var isGameActive: Bool {
        model.isGameActive
    }
    
    func gameActiveToggle() {
        model.toggleGameActiveBool()
    }
    
    func playEndingAudio() {
        model.playEndingAudio()
    }
    
    func playCountdownAudio() {
        model.playCountdownAudio()
    }
    
    
    // MARK: Game Data
    var score: Int {
        model.currentScore
    }
    
    var facesArray: Array<faces> {
        model.facesArray
    }
    
    func shuffle() {
        model.facesArray.shuffle()
    }
    
    
    // MARK: Testing Data
    //    var mouthStatus: mouthScale {
    //        model.mouthStatus
    //    }
    //
    //    var eyebrowStatus: eyebrowScale {
    //        model.eyebrowStatus
    //    }
    //
    //    var eyeStatus: eyeScale {
    //        model.eyeStatus
    //    }
    
}
