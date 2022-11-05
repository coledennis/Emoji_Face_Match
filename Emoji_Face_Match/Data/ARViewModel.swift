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
    
    var score: Int {
        model.currentScore
    }
    
//    var isSmiling: Bool {
//        var temp = false
//        if model.smileLeft > 0.3 || model.smileRight > 0.3 {
//            temp = true
//        }
//        return temp
//    }
    // FOR TESTING ONLY
//    var smileLeft: Float {
//        model.smileLeftVar
//    }
//    var smileRight: Float {
//        model.smileRightVar
//    }
//    var frownLeft: Float {
//        model.frownLeftVar
//    }
//    var frownRight: Float {
//        model.frownRightVar
//    }
//    
//    var mouthFunnelVar: Float {
//        model.mouthFunnelVar
//    }
//    var mouthPuckerVar: Float {
//        model.mouthPuckerVar
//    }
//    var mouthCloseVar: Float {
//        model.mouthCloseVar
//    }
//    var tongueOutVar: Float {
//        model.tongueOutVar
//    }
    var mouthStatus: mouthScale {
        model.mouthStatus
    }
//    
//    var jawOpenVar: Float {
//        model.jawOpenVar
//    }
//    var mouthLeft: Float {
//        model.mouthLeftVar
//    }
//    var mouthRight: Float {
//        model.mouthRightVar
//    }
    
    
//    var eyebrowInnerUp: Float {
//        model.eyebrowInnerUpVar
//    }
//    var eyebrowDownLeft: Float {
//        model.eyebrowDownLeftVar
//    }
//    var eyebrowDownRight: Float {
//        model.eyebrowDownRightVar
//    }
//    var eyebrowOuterUpRight: Float {
//        model.eyebrowOuterUpRightVar
//    }
//    var eyebrowOuterUpLeft: Float {
//        model.eyebrowOuterUpLeftVar
//    }
    
    var eyebrowStatus: eyebrowScale {
        model.eyebrowStatus
    }
    
//    var eyeWideLeftVar: Float {
//            model.eyeWideLeftVar
//        }
//    var eyeWideRightVar: Float {
//        model.eyeWideRightVar
//    }
//    
//    var eyeSquintLeftVar: Float {
//        model.eyeSquintLeftVar
//    }
//    var eyeSquintRightVar: Float {
//        model.eyeSquintRightVar
//    }
//    
//    var eyeBlinkLeftVar: Float {
//        model.eyeBlinkLeftVar
//    }
//    var eyeBlinkRightVar: Float {
//        model.eyeBlinkRightVar
//    }
//
//    var eyeLookUpLeftVar: Float {
//        model.eyeLookUpLeftVar
//    }
//    var eyeLookUpRightVar: Float {
//        model.eyeLookUpRightVar
//    }
//    
//    var eyeRightLookLeftVar: Float {
//        model.eyeRightLookLeftVar
//    }
//    var eyeLeftLookRightVar: Float {
//        model.eyeLeftLookRightVar
//    }
    var eyeStatus: eyeScale {
        model.eyeStatus
    }
    
    
    
    
//    var eyeBrowStatus: String {
//        model.eyebrowStatus.string
//    }
    ///
    
    func startSessionDelegate() {
        model.arView.session.delegate = self
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        if let faceAnchor = anchors.first  as? ARFaceAnchor {
            model.update(faceAnchor: faceAnchor)
        }
    }
    
}
