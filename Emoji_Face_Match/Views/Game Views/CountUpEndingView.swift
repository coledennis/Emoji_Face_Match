////
////  CountUpEndingView.swift
////  Emoji_Face_Match
////
////  Created by Cole Dennis on 11/19/22.
////
//
//import SwiftUI
//
//struct CountUpEndingView: View {
//    @AppStorage(StorageKeys.endingLowestTime.rawValue) var endingLowestTime: Int?
//    @ObservedObject var arViewModel : ARViewModel
//    @State var previousHighScore = 0
//    var body: some View {
//        ZStack {
//            ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
//            Rectangle().fill(.thinMaterial).edgesIgnoringSafeArea(.all)
//            VStack {
//                ScrollView(.vertical, showsIndicators: false) {
//                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 5, alignment: .center)]) {
//                        ForEach(arViewModel.model.collectedFaces, id: \.self) { face in
//                            face.image
//                                .resizable()
//                                .frame(width: 100, height: 100)
//                                .onTapGesture {
//                                    arViewModel.buttonHaptic()
//                                }
//                        }
//                    }
//                }
//                .padding()
//                Text("Time: \(arViewModel.gameTime) Seconds")  .font(.system(.largeTitle, design: .rounded).bold())
//                //                    .padding(.bottom)
//                if endingLowestTime != nil {
//                    if arViewModel.gameTime >= previousHighScore {
//                        Text("High Score: \(endingLowestTime!) Seconds")
//                            .font(.system(.title3, design: .rounded).bold())
//                    }
//                }
//                if arViewModel.gameTime < previousHighScore && endingLowestTime != nil {
//                    Text("New High Score!")
//                        .font(.system(.title2, design: .rounded).bold())
//                        .foregroundColor(.green)
//                    //                        .padding(.bottom)
//                    Text("Previous High Score: \(previousHighScore)")
//                        .font(.system(.title2, design: .rounded).bold())
//                    //                        .foregroundColor(.green)
//                }
//
//                Button {
//                    arViewModel.buttonHaptic()
//                    arViewModel.changeGameStage(newGameStage: .menu)
//                } label: {
//                    GameButtonView(text: "Back to Menu", color: .primary, icon: "arrowshape.turn.up.left")
//                }
//            }
//            .onAppear {
//                previousHighScore = endingLowestTime ?? 0
//                arViewModel.prepareHaptics()
//                arViewModel.endingHaptic()
//                arViewModel.playEndingAudio()
//            }
//        }
//    }
//}
//
//struct CountUpEndingView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountUpEndingView(arViewModel: ARViewModel.init())
//    }
//}
