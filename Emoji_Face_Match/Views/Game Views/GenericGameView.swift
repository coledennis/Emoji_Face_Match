//
//  GenericGameView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 11/6/22.
//

import SwiftUI

struct GenericGameView: View {
    @AppStorage(StorageKeys.endingHighestScore.rawValue) var endingHighestScore: Int?
    @AppStorage(StorageKeys.endingLowestTime.rawValue) var endingLowestTime: Int?
    
    @ObservedObject var arViewModel : ARViewModel
    
    @State var frameSize: CGFloat = 100
    var body: some View {
        ZStack {
            ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
            topBar
            currentEmoji
                .padding(5)
            //            testingData
        }
        .onAppear {
            arViewModel.prepareHaptics()
        }
        .task {
            
            if arViewModel.gameStage == .singlePlayer {
                
                while arViewModel.gameTime > 0 && arViewModel.isGameActive { // SHOULD THIS LOGIC BE IN ARMODEL?
                    do {
                        try await Task.sleep(nanoseconds: UInt64(1_000_000_000))
                        arViewModel.updateGameTime()
                        
                        if arViewModel.gameTime < 6 && arViewModel.gameTime > 0 {
                            arViewModel.playCountdownAudio()
                            arViewModel.buttonHaptic()
                        }
                        
                        if arViewModel.gameTime == 0 {
                            arViewModel.changeGameStage(newGameStage: .ending)
                        }
                    } catch {
                        print ("error 1")
                    }
                }
            } else if arViewModel.gameStage == .hotPotato {
                while arViewModel.isGameActive { // SHOULD THIS LOGIC BE IN ARMODEL?
                    do {
                        if arViewModel.score > 9 {
                            arViewModel.changeGameStage(newGameStage: .countUpEnding)
                        }
                        
                        try await Task.sleep(nanoseconds: UInt64(1_000_000_000))
                        arViewModel.updateGameTime()
                        
                    } catch {
                        print ("error 2")
                    }
                }
            }
        }
    }
    
    var topBar: some View {
        VStack {
            HStack(alignment: .top) {
                VStack {
                    Label(String(arViewModel.score), systemImage: "gamecontroller")
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial))
                    if arViewModel.gameStage == .singlePlayer {
                        if endingHighestScore != nil {
                            Label(String(endingHighestScore ?? 0), systemImage: "trophy")
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial))
                                .foregroundColor(.yellow)
                        }
                    } else if arViewModel.gameStage == .hotPotato {
                        if endingLowestTime != nil {
                            Label(String(endingLowestTime ?? 0), systemImage: "trophy")
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial))
                                .foregroundColor(.yellow)
                        }
                    }
                }
                Spacer()
                if arViewModel.gameStage == .singlePlayer {
                    Label(String(arViewModel.gameTime), systemImage: "clock")
                        .padding()
                        .foregroundColor(arViewModel.gameTime > 5 ? Color(uiColor: .label) : .red)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial))
                } else if arViewModel.gameStage == .hotPotato {
                    Label(String(arViewModel.gameTime), systemImage: "clock")
                    //                    .bold()
                        .padding()
                        .foregroundColor(arViewModel.gameTime < 60 ? Color(uiColor: .label) : .red)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial))
                }
            }
            .padding(.horizontal)
            Spacer()
            
            HStack {
                Spacer()
                Button {
                    arViewModel.buttonHaptic()
                    arViewModel.changeGameStage(newGameStage: .menu)
                } label: {
                    Label(String("Menu"), systemImage: "arrowshape.turn.up.backward")
                        .padding()
                        .foregroundColor(.primary)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.regularMaterial))
                }
            }
        }.font(.subheadline.weight(.bold))
            .padding(5)
    }
    
    var currentEmoji: some View {
        VStack {
            if arViewModel.model.facesArray.count > 0 {
                arViewModel.model.facesArray.first?.image
                    .resizable()
                    .frame(width: frameSize, height: frameSize)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 25).fill(.regularMaterial))
                    .onTapGesture {
                        changeEmoji()
                    }
            }
            Spacer()
        }
    }
    
    func changeEmoji() {
        arViewModel.simpleSuccess()
        arViewModel.shuffle()
        withAnimation(.spring(dampingFraction: 0.5)) {
            frameSize = 130
        }
        Task {
            do {
                try await Task.sleep(nanoseconds: UInt64(0_200_000_000))
                withAnimation(.spring(dampingFraction: 0.5)) {
                    frameSize = 100
                }
            } catch {
                print ("error")
            }
        }
    }
    
    //    var testingData: some View {
    //        VStack {
    //            Spacer()
    //            VStack {
    //                Text("Eyes: \(arViewModel.eyeStatus.string)")
    //                Text("Eyebrows: \(arViewModel.eyebrowStatus.string)")
    //                Text("Mouth: \(arViewModel.mouthStatus.string)")
    //            }
    //            .background(RoundedRectangle(cornerRadius: 10).fill(.regularMaterial))
    //
    //        }
    //    }
}

struct GenericGameView_Previews: PreviewProvider {
    static var previews: some View {
        GenericGameView(arViewModel: ARViewModel.init())
    }
}
