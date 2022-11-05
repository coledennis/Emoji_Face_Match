//
//  GameData.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 10/30/22.
//

import Foundation
import SwiftUI

enum GameStage: CaseIterable {
    case menu, singlePlayer, ending
}



enum faces {
    case Angry_face, Anguished_face, Anxious_face_with_sweat, Astonished_face, Beaming_face_with_smiling_eyes, Cat, Clown_face, Cold_face, Confounded_face, Cowboy_hat_face, Crying_face, Dissapointed_face, Dizzy_face, Downcast_face_with_sweat, Drooling_face, Exploding_head, Expressioless_face, Face_blowing_a_kiss, Face_savoring_food, Face_screaming_in_fear, Face_with_hand_over_mouth, Face_with_head_bandage, Face_with_medical_mask, Face_with_monocle, Face_with_open_mouth, Face_with_raised_eyebrow, Face_with_rolling_eyes, Face_with_steam_from_nose, Face_with_symbols_on_mouth, Face_with_tears_of_joy, Face_with_thermometer, Face_with_tongue, Face_without_mouth, Fearful_face, Flushed_face, Frowning_face_with_open_mouth, Frowning_face, Grimacing_face, Grinning_face_with_big_eyes, Grinning_face_with_sweat, Grinning_face_1, Grinning_face, Grinning_squinting_face, Hot_face, Hugging_face, Hushed_face, Joker, Kissing_face_with_closed_eyes, Kissing_face_with_smiling_eyes, Kissing_face, Lion, Loudly_crying_face, Lying_face, Money_mouth_face_$, Monkey, Nauseated_face, Nerd_face, Neutral_face, Panda, Partying_face, Pensive_face, Pile_of_poo, Pleading_face, Pouting_face, Relieved_face, Robot, Rolling_on_the_floor_laughing, Sad_but_relieved_face, Santa_Claus, Scrunched_face, Shushing_face, Sleep_face, Sleepy_face, Slightly_frowning_face, Slightly_smiling_face, Smiling_face_with_halo, Smiling_face_with_heart_eyes, Smiling_face_with_hearts, Smiling_face_with_smiling_eyes, Smiling_face_with_sunglasses, Smiling_face, Smirking_face, Sneezing_face, Squinting_face_with_tongue, Star_struck, Thinking_face, Tired_face, Unamused_face, Upside_down_face, Vomiting_face, Weary_face, Winking_face_with_tongue, Winking_face, Woozy_face, Worried_face_1, Worried_face, Yawning_face, Zany_face, Zipper_mouth_face
    
    
    var name: String {
        switch self {
        case .Angry_face: return "Angry Face"
        case .Clown_face: return "Clown Face"
        default: return "Clown face"
        }
    }
    
    var image: Image {
        switch self {
        case .Angry_face: return Image("Angry face")
        case .Clown_face: return Image("Clown face")
        default: return Image("Clown face")
        }
    }
    
    
    var smileLeft: expressionScale {
        switch self {
        case .Angry_face: return .light
        case .Clown_face: return .heavy
        default: return .medium
        }
    }
    
    
}



enum expressionScale {
    case none, light, medium, heavy
    
    var value : Float {
        switch self {
        case .none:
            return 0
        case .light:
            return 0.3
        case .medium:
            return 0.5
        case .heavy:
            return 0.7
        }
    }
}

enum eyebrowScale {
    case neutral, surprised, furrowed, splitSkeptical
    
    var string: String {
        switch self {
        case .neutral: return "Neutral"
        case .surprised:
            return "Suprised"
        case .furrowed:
            return "Furrowed"
        case .splitSkeptical:
            return "Skeptical"
        }
    }
}


enum eyeScale {
    case neutral, closed, wideOpen, rollingEyesUp, squinting, wink
    
    var string: String {
        switch self {
        case .neutral: return "Neutral"
            
        case .closed:
            return "Closed"
        case .wideOpen:
            return "Wide Open"
        case .rollingEyesUp:
            return "Rolling Eyes Up"
        case .squinting:
            return "Squinting"
        case .wink:
            return "Winking"
        }
    }
}

enum mouthScale {
    case neutral, smile, frown, openMouthSmile, openMouthNeutral, tongueOut, openMouthTeethNoSmile, smileWithTeeth, kissFace
    
    var string: String {
        switch self {
        case .neutral: return "Neutral"
        case .smile:
            return "Smile"
        case .frown:
            return "Frown"
        case .openMouthSmile:
            return "Open Mouth Smile"
        case .openMouthNeutral:
            return "Open Mouth Neutral"
        case .tongueOut:
            return "Tongue Out"
        case .openMouthTeethNoSmile:
            return "Open Mouth Teeth No Smile"
        case .smileWithTeeth:
            return "Smile With Teetch"
        case .kissFace:
            return "Kiss Face"
        }
    }
}
