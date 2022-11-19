//
//  TutorialView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 11/19/22.
//

import SwiftUI

struct TutorialView: View {
    @ObservedObject var arViewModel : ARViewModel
    var body: some View {
        ZStack {
            ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
            Rectangle().fill(.thinMaterial).edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView {
                    VStack(alignment: .center) {
                        Text("Welcome to")
                            .font(.system(.title, design: .rounded).bold())
                        Text("Emoji Face Match!")
                            .font(.system(.largeTitle, design: .rounded).bold())
                        Text("To play, you will need make different facial expressions using your Eyebrows, Eyes, and Mouth.")
                            .padding(.horizontal)
                        
                        Group {
                            Text("Eyebrows")
                                .font(.system(.title, design: .rounded).bold())
                                .padding(.top)
                            ForEach(eyebrowScale.allCases, id: \.self) { position in
                                Text(position.string)
                                    .foregroundColor(arViewModel.model.eyebrowStatus == position ? .green : .primary)
                                    .font(.system(.title3, design: .rounded).bold())
                            }
                        }
                        
                        Group {
                            Text("Eyes")
                                .font(.system(.title, design: .rounded).bold())
                                .padding(.top)
                            ForEach(eyeScale.allCases, id: \.self) { position in
                                Text(position.string)
                                    .foregroundColor(arViewModel.model.eyeStatus == position ? .green : .primary)
                                    .font(.system(.title3, design: .rounded).bold())
                            }
                        }
                        
                        Group {
                            Text("Mouth")
                                .font(.system(.title, design: .rounded).bold())
                                .padding(.top)
                            ForEach(mouthScale.allCases, id: \.self) { position in
                                Text(position.string)
                                    .foregroundColor(arViewModel.model.mouthStatus == position ? .green : .primary)
                                    .font(.system(.title3, design: .rounded).bold())
                            }
                        }
                        
                    }.padding()
                }
                Button {
                    arViewModel.changeGameStage(newGameStage: .menu)
                } label: {
                    GameButtonView(text: "Back To Menu", color: .green, icon: "arrowshape.turn.up.backward")
                }
            }
        }
        .onAppear {
            arViewModel.gameActiveToggle()
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(arViewModel: ARViewModel.init())
    }
}
