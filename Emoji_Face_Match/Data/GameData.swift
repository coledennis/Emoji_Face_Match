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



enum faces: CaseIterable {
    case Angry_face, Anguished_face, Anxious_face_with_sweat, Astonished_face, Beaming_face_with_smiling_eyes, Cat, Clown_face, Cold_face, Confounded_face, Cowboy_hat_face, Crying_face, Disapointed_face, Dizzy_face, Downcast_face_with_sweat, Drooling_face, Exploding_head, Expressionless_face, Face_blowing_a_kiss, Face_savoring_food, Face_screaming_in_fear, Face_with_head_bandage, Face_with_monocle, Face_with_open_mouth, Face_with_raised_eyebrow, Face_with_rolling_eyes, Face_with_steam_from_nose, Face_with_tears_of_joy, Face_with_thermometer, Face_with_tongue, Fearful_face, Flushed_face, Frowning_face_with_open_mouth, Frowning_face, Grimacing_face, Grinning_face_with_big_eyes, Grinning_face_with_sweat, Grinning_face_1, Grinning_face, Grinning_squinting_face, Hot_face, Hushed_face, Joker, Kissing_face_with_closed_eyes, Kissing_face_with_smiling_eyes, Kissing_face, Lion, Loudly_crying_face, Money_mouth_face_$, Monkey, Nauseated_face, Nerd_face, Neutral_face, Panda, Pensive_face, Pile_of_poo, Pleading_face, Pouting_face, Relieved_face, Rolling_on_the_floor_laughing, Sad_but_relieved_face, Santa_Claus, Sleep_face, Sleepy_face, Slightly_frowning_face, Slightly_smiling_face, Smiling_face_with_halo, Smiling_face_with_heart_eyes, Smiling_face_with_hearts, Smiling_face_with_smiling_eyes, Smiling_face, Squinting_face_with_tongue, Star_struck, Thinking_face, Tired_face, Vomiting_face, Weary_face, Winking_face_with_tongue, Winking_face, Worried_face_1, Worried_face
    
    
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
        case .Anguished_face:
            return Image("Anguished face")
        case .Anxious_face_with_sweat:
            return Image("Anxious face with sweat")
        case .Astonished_face:
            return Image("Astonished face")
        case .Beaming_face_with_smiling_eyes:
            return Image("Beaming face with smiling eyes")
        case .Cat:
            return Image("Cat")
        case .Clown_face:
            return Image("Clown face")
        case .Cold_face:
            return Image("Cold face")
        case .Confounded_face:
            return Image("Confounded face")
        case .Cowboy_hat_face:
            return Image("Cowboy hat face")
        case .Crying_face:
            return Image("Crying face")
        case .Disapointed_face:
            return Image("Disapointed face")
        case .Dizzy_face:
            return Image("Dizzy face")
        case .Downcast_face_with_sweat:
            return Image("Downcast face with sweat")
        case .Drooling_face:
            return Image("Drooling face")
        case .Exploding_head:
            return Image("Exploding head")
        case .Expressionless_face:
            return Image("Expressionless face")
        case .Face_blowing_a_kiss:
            return Image("Face blowing a kiss")
        case .Face_savoring_food:
            return Image("Face savoring food")
        case .Face_screaming_in_fear:
            return Image("Face screaming in fear")
        case .Face_with_head_bandage:
            return Image("Face with head-bandage")
        case .Face_with_monocle:
            return Image("Face with monocle")
        case .Face_with_open_mouth:
            return Image("Face with open mouth")
        case .Face_with_raised_eyebrow:
            return Image("Face with raised eyebrow")
        case .Face_with_rolling_eyes:
            return Image("Face with rolling eyes")
        case .Face_with_steam_from_nose:
            return Image("Face with steam from nose")
        case .Face_with_tears_of_joy:
            return Image("Face with tears of joy")
        case .Face_with_thermometer:
            return Image("Face with thermometer")
        case .Face_with_tongue:
            return Image("Face with tongue")
        case .Fearful_face:
            return Image("Fearful face")
        case .Flushed_face:
            return Image("Flushed face")
        case .Frowning_face_with_open_mouth:
            return Image("Frowning face with open mouth")
        case .Frowning_face:
            return Image("Frowning face")
        case .Grimacing_face:
            return Image("Grimacing face")
        case .Grinning_face_with_big_eyes:
            return Image("Grinning face with big eyes")
        case .Grinning_face_with_sweat:
            return Image("Grinning face with sweat")
        case .Grinning_face_1:
            return Image("Grinning face-1")
        case .Grinning_face:
            return Image("Grinning face")
        case .Grinning_squinting_face:
            return Image("Grinning squinting face")
        case .Hot_face:
            return Image("Hot face")
        case .Hushed_face:
            return Image("Hushed face")
        case .Joker:
            return Image("Joker")
        case .Kissing_face_with_closed_eyes:
            return Image("Kissing face with closed eyes")
        case .Kissing_face_with_smiling_eyes:
            return Image("Kissing face with smiling eyes")
        case .Kissing_face:
            return Image("Kissing face")
        case .Lion:
            return Image("Lion")
        case .Loudly_crying_face:
            return Image("Loudly crying face")
        case .Money_mouth_face_$:
            return Image("Money mouth face $")
        case .Monkey:
            return Image("Monkey")
        case .Nauseated_face:
            return Image("Nauseated face")
        case .Nerd_face:
            return Image("Nerd face")
        case .Neutral_face:
            return Image("Neutral face")
        case .Panda:
            return Image("Panda")
        case .Pensive_face:
            return Image("Pensive face")
        case .Pile_of_poo:
            return Image("Pile of poo")
        case .Pleading_face:
            return Image("Pleading face")
        case .Pouting_face:
            return Image("Pouting face")
        case .Relieved_face:
            return Image("Relieved face")
        case .Rolling_on_the_floor_laughing:
            return Image("Rolling on the floor laughing")
        case .Sad_but_relieved_face:
            return Image("Sad but relieved face")
        case .Santa_Claus:
            return Image("Santa Claus")
        case .Sleep_face:
            return Image("Sleep face")
        case .Sleepy_face:
            return Image("Sleepy face")
        case .Slightly_frowning_face:
            return Image("Slightly frowning face")
        case .Slightly_smiling_face:
            return Image("Slightly smiling face")
        case .Smiling_face_with_halo:
            return Image("Smiling face with halo")
        case .Smiling_face_with_heart_eyes:
            return Image("Smiling face with heart-eyes")
        case .Smiling_face_with_hearts:
            return Image("Smiling face with hearts")
        case .Smiling_face_with_smiling_eyes:
            return Image("Smiling face with smiling eyes")
        case .Smiling_face:
            return Image("Smiling face")
        case .Squinting_face_with_tongue:
            return Image("Squinting face with tongue")
        case .Star_struck:
            return Image("Star-struck")
        case .Thinking_face:
            return Image("Thinking face")
        case .Tired_face:
            return Image("Tired face")
        case .Vomiting_face:
            return Image("Vomiting face")
        case .Weary_face:
            return Image("Weary face")
        case .Winking_face_with_tongue:
            return Image("Winking face with tongue")
        case .Winking_face:
            return Image("Winking face")
        case .Worried_face_1:
            return Image("Worried face-1")
        case .Worried_face:
            return Image("Worried face")
        }
    }
    
    var eyeScale: eyeScale {
        switch self {
        case .Angry_face: return .neutral
        default: return .wink
        }
    }
        
        var mouthScale: mouthScale {
            switch self {
            case .Angry_face: return .frown
            default: return .kissFace
            }
    }
    
    var eyebrowScale: eyebrowScale {
        switch self {
        case .Angry_face: return .furrowed
        default: return .splitSkeptical
        }
    }
    
//    var smileLeft: expressionScale {
//        switch self {
//        case .Angry_face: return .light
//        case .Clown_face: return .heavy
//        default: return .medium
//        }
//    }
    
    
}



//enum expressionScale {
//    case none, light, medium, heavy
//
//    var value : Float {
//        switch self {
//        case .none:
//            return 0
//        case .light:
//            return 0.3
//        case .medium:
//            return 0.5
//        case .heavy:
//            return 0.7
//        }
//    }
//}

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
