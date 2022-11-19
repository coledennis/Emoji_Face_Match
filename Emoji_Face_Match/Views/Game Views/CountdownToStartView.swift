//
//  CountdownToStartView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 11/19/22.
//

import SwiftUI

struct CountdownToStartView: View {
    @ObservedObject var arViewModel : ARViewModel
    var body: some View {
        ZStack {
            ARViewContainer(arViewModel: arViewModel)
            Rectangle().fill(.thinMaterial)
            VStack(alignment: .center) {
                
                switch arViewModel.gameStage {
                case .singlePlayer:
                    Text("""
    Use your eyebrows, eyes, and mouth to recreate the emoji's on screen!
    
    Collect 10 points to stop the clock and win!
    """)
                    .font(.system(.title3, design: .rounded).bold())
                    .padding(.bottom)
                case .hotPotato:
                    Text("""
    Use your eyebrows, eyes, and mouth to recreate the emoji's on screen!
    
    When you score a point, hand the phone off to the next player as fast as possible as the timer won't stop until the game ends!
    
    Collect 10 points to stop the clock and win!
    """)
                    .font(.system(.title3, design: .rounded).bold())
                    .padding(.bottom)
                default:
                    EmptyView()
                }
                
                Text(String(arViewModel.countdownTime))
                    .font(.system(.largeTitle, design: .rounded).bold())
            }.padding(40)
        }.edgesIgnoringSafeArea(.all)
        
        
            .task {
                while arViewModel.countdownTime > 0 { // SHOULD THIS LOGIC BE IN ARMODEL?
                    do {
                        try await Task.sleep(nanoseconds: UInt64(1_000_000_000))
                        arViewModel.countdownTimeUpdate()
                        arViewModel.buttonHaptic()
                    } catch {
                        print ("error 1")
                    }
                }
            }
            .onAppear {
                arViewModel.prepareHaptics()
            }
    }
}

struct CountdownToStartView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownToStartView(arViewModel: ARViewModel.init())
    }
}
