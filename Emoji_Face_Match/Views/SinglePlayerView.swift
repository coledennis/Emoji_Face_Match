//
//  SinglePlayerView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 10/30/22.
//

import SwiftUI

struct SinglePlayerView: View {
    @State private var timeRemaining = 15
    @ObservedObject var arViewModel : ARViewModel
    var body: some View {
        ZStack {
            ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Label(String(arViewModel.score), systemImage: "trophy")
                        .bold()
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial))
                    Spacer()
                    Label(String(timeRemaining), systemImage: "clock")
                        .bold()
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial))
                }
                .padding(.horizontal)
                Spacer()
                
            }
            .padding(5)
            // break this out into a separate view / variable
            VStack {
                VStack {
                    if arViewModel.model.facesArray.count > 0 {
                        arViewModel.model.facesArray.first?.image
                    }
                    //                    faces.Angry_face.image
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).fill(.regularMaterial))
                Spacer()
            }
            .padding(5)
                        VStack {
                            Spacer()
                            
                            VStack {
                                HStack {
                                    Text("eyeWideLeftVar")
//                                    Text(arViewModel.eyeWideLeftVar.description)
                                }
//                                HStack {
//                                    Text("eyeWideRightVar")
//                                    Text(arViewModel.eyeWideRightVar.description)
//                                }
//
//                                HStack {
//                                    Text("eyeSquintLeftVar")
//                                    Text(arViewModel.eyeSquintLeftVar.description)
//                                }
//                                HStack {
//                                    Text("eyeSquintRightVar")
//                                    Text(arViewModel.eyeSquintRightVar.description)
//                                }
//
//
//                                HStack {
//                                    Text("eyeBlinkLeftVar")
//                                    Text(arViewModel.eyeBlinkLeftVar.description)
//                                }
//                                HStack {
//                                    Text("eyeBlinkRightVar")
//                                    Text(arViewModel.eyeBlinkRightVar.description)
//                                }
//                                Group {
//                                    HStack {
//                                        Text("eyeLookUpRightVar")
//                                        Text(arViewModel.eyeLookUpRightVar.description)
//                                    }
//                                    HStack {
//                                        Text("eyeLookUpRightVar")
//                                        Text(arViewModel.eyeLookUpRightVar.description)
//                                    }
//
//                                    HStack {
//                                        Text("eyeRightLookLeftVar")
//                                        Text(arViewModel.eyeRightLookLeftVar.description)
//                                    }
//                                    HStack {
//                                        Text("eyeLeftLookRightVar")
//                                        Text(arViewModel.eyeLeftLookRightVar.description)
//                                    }
//                                    HStack {
//                                        Text("eye status")
//                                        Text(arViewModel.eyeStatus.string)
//                                    }
//                                }
                                //
                                //                            HStack {
                                //                                               Text("eyebrow status")
                                //                                Text(arViewModel.eyeBrowStatus)
                                //                            }
            
                            }
                            .bold()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.regularMaterial))
                        }
//            VStack {
//                Spacer()
                
//                VStack {
//                    HStack {
//                        Text("eyeWideLeftVar")
//                        Text(arViewModel.eyeWideLeftVar.description)
//                    }
//                    HStack {
//                        Text("eyeWideRightVar")
//                        Text(arViewModel.eyeWideRightVar.description)
//                    }
//
//                    HStack {
//                        Text("eyeSquintLeftVar")
//                        Text(arViewModel.eyeSquintLeftVar.description)
//                    }
//                    HStack {
//                        Text("eyeSquintRightVar")
//                        Text(arViewModel.eyeSquintRightVar.description)
//                    }
//
//
//                    HStack {
//                        Text("eyeBlinkLeftVar")
//                        Text(arViewModel.eyeBlinkLeftVar.description)
//                    }
//                    HStack {
//                        Text("eyeBlinkRightVar")
//                        Text(arViewModel.eyeBlinkRightVar.description)
//                    }
//                    Group {
//                        HStack {
//                            Text("eyeLookUpRightVar")
//                            Text(arViewModel.eyeLookUpRightVar.description)
//                        }
//                        HStack {
//                            Text("eyeLookUpRightVar")
//                            Text(arViewModel.eyeLookUpRightVar.description)
//                        }
//
//                        HStack {
//                            Text("eyeRightLookLeftVar")
//                            Text(arViewModel.eyeRightLookLeftVar.description)
//                        }
//                        HStack {
//                            Text("eyeLeftLookRightVar")
//                            Text(arViewModel.eyeLeftLookRightVar.description)
//                        }
//                        HStack {
//                            Text("eye status")
//                            Text(arViewModel.eyeStatus.string)
//                        }
//                    }
//                    //
//                    //                            HStack {
//                    //                                               Text("eyebrow status")
//                    //                                Text(arViewModel.eyeBrowStatus)
//                    //                            }
//
//                }
//                .bold()
//                    .background(RoundedRectangle(cornerRadius: 10).fill(.regularMaterial))
//            }
           
//            VStack {
//                Spacer()
////                HStack {
////                    Text("Inner")
////                    Text(arViewModel.eyebrowInnerUp.description)
////                }
////                HStack {
////                    Text("Down Left")
////                    Text(arViewModel.eyebrowDownLeft.description)
////                }
////                HStack {
////                    Text("Frown left")
////                    Text(arViewModel.eyebrowDownRight.description)
////                }
////                HStack {
////
////                    Text("Outer Up Left")
////                    Text(arViewModel.eyebrowOuterUpLeft.description)
////                }
////                HStack {
////                    Text("Outer Up Right")
////                    Text(arViewModel.eyebrowOuterUpRight.description)
////                }
//                HStack {
//                                   Text("eyebrow status")
//                    Text(arViewModel.eyeBrowStatus)
//                }.bold()
//                    .background(RoundedRectangle(cornerRadius: 10).fill(.regularMaterial))
//
//            }
            VStack {
                Spacer()
                VStack {
                    HStack {
                        Text("Smile left")
                        Text(arViewModel.smileLeft.description)
                    }
                    HStack {
                        Text("Smile right")
                        Text(arViewModel.smileRight.description)
                    }
                    HStack {
                        Text("Frown left")
                        Text(arViewModel.frownLeft.description)
                    }
                    HStack {
                        
                        Text("Frown Right")
                        Text(arViewModel.frownRight.description)
                    }
                    HStack {
                        Text("Mouth Close")
                        Text(arViewModel.mouthCloseVar.description)
                    }
                    HStack {
                        
                        Text("Mouth Pucker")
                        Text(arViewModel.mouthPuckerVar.description)
                    }
                    HStack {
                        
                        Text("Mouth Funnel")
                        Text(arViewModel.mouthFunnelVar.description)
                    }
                    HStack {
                        
                        Text("Tongue Out")
                        Text(arViewModel.tongueOutVar.description)
                    }
                    
                    HStack {
                        
                        Text("Jaw Open")
                        Text(arViewModel.tongueOutVar.description)
                    }
                    
                    HStack {
                        
                        Text("Mouth Status")
                        Text(arViewModel.mouthStatus.string)
                    }
                }
                .bold()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.regularMaterial))

            }
        }
        .task {
             while timeRemaining > 0 {
                 do {
                     try await Task.sleep(nanoseconds: UInt64(1_000_000_000))
                     timeRemaining -= 1
                 } catch {
                     print ("error")
                 }
            }
        }
    }
}

struct SinglePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayerView(arViewModel: ARViewModel.init())
    }
}
