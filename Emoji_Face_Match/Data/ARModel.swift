//
//  ARModel.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 10/30/22.
//

import Foundation
import RealityKit
import ARKit

import AVFoundation

struct ARModel {
    private(set) var arView : ARView
    
    var gameStageVar: GameStage = .menu
    
    var currentScore: Int = 0
    
    var facesArray: Array<faces> = []
    
    
    
    // for testing only
//    var smileLeftVar : Float = 0
//    var smileRightVar: Float = 0
//    var frownLeftVar: Float = 0
//    var frownRightVar: Float = 0
//    var mouthCloseVar: Float = 0
//    var mouthFunnelVar: Float = 0
//    var mouthPuckerVar: Float = 0
//    var tongueOutVar: Float = 0
//    var jawOpenVar: Float = 0
    
    var mouthStatus: mouthScale = .neutral
    
    
    
//    var eyebrowInnerUpVar : Float = 0
//    var eyebrowDownLeftVar: Float = 0
//    var eyebrowDownRightVar: Float = 0
//    var eyebrowOuterUpLeftVar: Float = 0
//    var eyebrowOuterUpRightVar: Float = 0
    var eyebrowStatus: eyebrowScale = .neutral
    
//    var eyeWideLeftVar: Float = 0
//    var eyeWideRightVar: Float = 0
//
//    var eyeSquintLeftVar: Float = 0
//    var eyeSquintRightVar: Float = 0
//
//    var eyeBlinkLeftVar: Float = 0
//    var eyeBlinkRightVar: Float = 0
//
//    var eyeLookUpLeftVar: Float = 0
//    var eyeLookUpRightVar: Float = 0
//
//    var eyeRightLookLeftVar: Float = 0
//    var eyeLeftLookRightVar: Float = 0
    var eyeStatus: eyeScale = .neutral
    //
    
    var faceRing: FaceRing.Scene?
    
    var successAudio: AVAudioPlayer?
    var endingAudio: AVAudioPlayer?
    init() {
        arView = ARView(frame: .zero)
        let config = ARFaceTrackingConfiguration()
//        let config = ARWorldTrackingConfiguration()

//        config.frameSemantics.insert(.personSegmentation)
//        config.userFaceTrackingEnabled = true
        arView.session.run(config)
        for face in faces.allCases {
            facesArray.append(face)
        }
        facesArray.shuffle()
//        facesArray = [.Angry_face, .Clown_face]
        
        
        let faceRingAnchor = try! FaceRing.loadScene()
        faceRing = faceRingAnchor
//        faceRingAnchor.name = "FaceRing"
        arView.scene.anchors.append(faceRingAnchor)
        

        let successPath = Bundle.main.path(forResource: "Success V5.wav", ofType:nil)!
        let successUrl = URL(fileURLWithPath: successPath)
        
        let endingAudioPath = Bundle.main.path(forResource: "Ending Audio.wav", ofType:nil)!
        let endingAudioUrl = URL(fileURLWithPath: endingAudioPath)
        
        do {
            successAudio = try AVAudioPlayer(contentsOf: successUrl)
            endingAudio = try AVAudioPlayer(contentsOf: endingAudioUrl)
        } catch {
            print("could not access success audio")
        }
    }
    
    mutating func update(faceAnchor: ARFaceAnchor){
        
        // LIPS
        let smileRight = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .mouthSmileRight})?.value ?? 0)
//        smileRightVar = smileRight
        let smileLeft = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .mouthSmileLeft})?.value ?? 0)
//        smileLeftVar = smileLeft
        let frownRight = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .mouthFrownRight})?.value ?? 0)
//        frownRightVar = frownRight
        let frownLeft = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .mouthFrownLeft})?.value ?? 0)
//        frownLeftVar = frownLeft
        
//        let mouthLeft = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .mouthLeft})?.value ?? 0)
//        mouthLeftVar = mouthLeft
//        let mouthRight = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .mouthRight})?.value ?? 0)
//        mouthRightVar = mouthRight
        
//        let mouthClose = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .mouthClose})?.value ?? 0)
//        mouthCloseVar = mouthClose
        
        let mouthFunnel = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .mouthFunnel})?.value ?? 0)
//        mouthFunnelVar = mouthFunnel
        
        let mouthPucker = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .mouthPucker})?.value ?? 0)
//        mouthPuckerVar = mouthPucker
        
        let tongueOut = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .tongueOut})?.value ?? 0)
//        tongueOutVar = tongueOut
        
//        let jawOpen = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .jawOpen})?.value ?? 0)
//        jawOpenVar = jawOpen
//        smileRightVar = smileRight
//        let mouthPucker = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .mouth})?.value ?? 0)
        
        
//        smileRightVar = smileRight
        
        
        /*let*/ mouthStatus = mouthCheck(tongueOut: tongueOut, frownLeft: frownLeft, frownRight: frownRight, smileLeft: smileLeft, smileRight: smileRight, mouthPucker: mouthPucker, mouthFunnel: mouthFunnel)
        
        
        // EYES?
        let eyeWideLeft = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .eyeWideLeft})?.value ?? 0)
//        eyeWideLeftVar = eyeWideLeft
        let eyeWideRight = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .eyeWideRight})?.value ?? 0)
//        eyeWideRightVar = eyeWideRight
        let eyeSquintLeft = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .eyeSquintLeft})?.value ?? 0)
//        eyeSquintLeftVar = eyeSquintLeft
        let eyeSquintRight = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .eyeSquintRight})?.value ?? 0)
//        eyeSquintRightVar = eyeSquintRight
        
        
        let eyeBlinkLeft = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .eyeBlinkLeft})?.value ?? 0)
//        eyeBlinkLeftVar = eyeBlinkLeft
        let eyeBlinkRight = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .eyeBlinkRight})?.value ?? 0)
//        eyeBlinkRightVar = eyeBlinkRight

        let eyeLookUpLeft = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .eyeLookUpLeft})?.value ?? 0)
//        eyeLookUpLeftVar = eyeLookUpLeft
        let eyeLookUpRight = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .eyeLookUpRight})?.value ?? 0)
//        eyeLookUpRightVar = eyeLookUpRight
//        let eyeRightLookLeft = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .eyeLookInRight})?.value ?? 0)
////        eyeRightLookLeftVar = eyeRightLookLeft
//        let eyeLeftLookRight = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .eyeLookInLeft})?.value ?? 0)
//        eyeLeftLookRightVar = eyeLeftLookRight

        /*let*/ eyeStatus = eyeCheck(eyeBlinkLeft: eyeBlinkLeft, eyeBlinkRight: eyeBlinkRight, eyeWideLeft: eyeWideLeft, eyeWideRight: eyeWideRight, eyeLookUpLeft: eyeLookUpLeft, eyeLookUpRight: eyeLookUpRight, eyeSquintLeft: eyeSquintLeft, eyeSquintRight: eyeSquintRight)
        
        
        
        // EYEBROWS
        let eyebrowInnerUp = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .browInnerUp})?.value ?? 0)
//        eyebrowInnerUpVar = eyebrowInnerUp
        let eyebrowDownLeft = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .browDownLeft})?.value ?? 0)
//        eyebrowDownLeftVar = eyebrowDownLeft
        let eyebrowDownRight = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .browDownRight})?.value ?? 0)
//        eyebrowDownRightVar = eyebrowDownRight
//        let eyebrowOuterUpLeft = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .browOuterUpLeft})?.value ?? 0)
//        eyebrowOuterUpLeftVar = eyebrowOuterUpLeft
//        let eyebrowOuterUpRight = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .browOuterUpRight})?.value ?? 0)
//        eyebrowOuterUpRightVar = eyebrowOuterUpRight
//        mouthLeftVar = mouthLeft
//        let mouthRight = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .mouthRight})?.value ?? 0)
//        mouthRightVar = mouthRight
        
        /*let*/  eyebrowStatus = eyebrowCheck(eyebrowInnerUp: eyebrowInnerUp, eyebrowDownLeft: eyebrowDownLeft, eyebrowDownRight: eyebrowDownRight)
        
        // TOUNGE
        
        if facesArray.count > 0 {
//            faceCheck(face: facesArray.first!, smileLeft: smileLeft, smileRight: smileRight)
            faceCheck(face: facesArray.first!, eyes: eyeStatus, eyebrows: eyebrowStatus, mouth: mouthStatus)
        }
    }
    
    // Game Logic Below
    
    mutating func faceCheck(face: faces, eyes: eyeScale, eyebrows: eyebrowScale, mouth: mouthScale ) {
        if (face.eyeScale.contains(where: {$0 == eyes})) && face.eyebrowScale == eyebrows && face.mouthScale == mouth {
            currentScore += 1
            simpleSuccess()
            facesArray.remove(at: 0)
            
            
            faceRing?.notifications.ringAnimation.post()
            
            successAudio?.play()
//            let FaceRing = arView.scene.anchors.first(where: {$0.name == "FaceRing"}) as FaceRing
//            self.universalScene.notifications.gameOverTrigger.post()
        }
        
//        if  smileLeft >= face.smileLeft.value {
//            //            updateGameStage(gameStage: .ending)
//            if face == facesArray.first {
//                currentScore += 1
//                facesArray.remove(at: 0)
//            }
//
//        }
    }
    
    mutating func eyebrowCheck(eyebrowInnerUp: Float, eyebrowDownLeft: Float, eyebrowDownRight: Float) -> eyebrowScale {

        var result = eyebrowScale.neutral
        
        if eyebrowInnerUp > 0.6 && eyebrowDownLeft == 0 && eyebrowDownRight == 0 {
            result = .surprised
        } else if eyebrowInnerUp > 0.1 && ( (eyebrowDownLeft < 0.3 && eyebrowDownLeft > 0 ) || ( eyebrowDownRight < 0.3 && eyebrowDownRight > 0 )) {
                result = .splitSkeptical
        } else if eyebrowDownRight > 0.7 && eyebrowDownLeft > 0.7 {
                result = .furrowed
            }
        
        return result
    }
    
    mutating func eyeCheck(eyeBlinkLeft: Float, eyeBlinkRight: Float, eyeWideLeft: Float, eyeWideRight: Float, eyeLookUpLeft: Float, eyeLookUpRight: Float, eyeSquintLeft: Float, eyeSquintRight: Float) -> eyeScale {

        var result = eyeScale.neutral

        if eyeLookUpLeft > 0.7 && eyeLookUpRight > 0.7 {
            result = .rollingEyesUp
        } else if eyeBlinkLeft > 0.8 && eyeBlinkRight > 0.8 {
            result = .closed
        } else if eyeWideLeft > 0.5 && eyeWideRight > 0.5 {
            result = .wideOpen
        }  else if (eyeBlinkLeft > 0.8 && eyeBlinkRight < 0.2) || (eyeBlinkRight > 0.8 && eyeBlinkLeft < 0.2) {
            result = .wink
        } else if eyeSquintLeft > 0.3 && eyeSquintRight > 0.3 {
            result = .squinting
        }

        
        return result
    }
    
    mutating func mouthCheck(tongueOut: Float, frownLeft: Float, frownRight: Float, smileLeft: Float, smileRight: Float, mouthPucker: Float, mouthFunnel: Float) -> mouthScale {

        var result = mouthScale.neutral

        if tongueOut > 0.2 {
            result = .tongueOut
        } else if mouthPucker > 0.7 {
            result = .kissFace
        } else if frownLeft > 0.35 && frownRight > 0.35 {
            result = .frown
        } else if smileLeft > 0.4 && smileRight > 0.4 {
            if mouthFunnel > 0.04 {
                result = .openMouthSmile
            } else {
                result = .smile
            }
        } else if mouthFunnel > 0.1 {
            result = .openMouthNeutral
        }
        
        
//        if eyeLookUpLeft > 0.7 && eyeLookUpRight > 0.7 {
//            result = .rollingEyesUp
//        } else if eyeBlinkLeft > 0.8 && eyeBlinkRight > 0.8 {
//            result = .closed
//        } else if eyeWideLeft > 0.5 && eyeWideRight > 0.5 {
//            result = .wideOpen
//        }  else if (eyeBlinkLeft > 0.8 && eyeBlinkRight < 0.2) || (eyeBlinkRight > 0.8 && eyeBlinkLeft < 0.2) {
//            result = .wink
//        } else if eyeSquintLeft > 0.3 && eyeSquintRight > 0.3 {
//            result = .squinting
//        }

        
        return result
    }
    
    mutating func updateGameStage(gameStage: GameStage) {
        gameStageVar = gameStage
    }
    // Game Logic Above
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func playEndingAudio() {
        endingAudio?.play()
    }
}
