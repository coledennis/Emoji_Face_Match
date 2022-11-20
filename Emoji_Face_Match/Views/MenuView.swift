//
//  MenuView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 10/30/22.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @ObservedObject var arViewModel : ARViewModel
    @State var backgroundImage: Image?
    @State var frameSize: CGFloat = 100
    var body: some View {
        ZStack {
            ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
                .onAppear {
                    backgroundImage = arViewModel.facesArray.randomElement()?.image
                }
            Rectangle().fill(.thinMaterial).edgesIgnoringSafeArea(.all)
                switch verticalSizeClass {
                case .compact:
                    VStack {
                        Text("Match the 'Moji")
                            .font(.system(.largeTitle, design: .rounded).bold())
                        Text("Games You Play With Your FACE!")
                            .font(.system(.subheadline, design: .rounded).bold())
                        HStack {
                            backgroundImage?
                                .resizable()
                                .frame(width: frameSize*2, height: frameSize*2)
                                .onTapGesture {
                                    changeEmoji()
                                }
                            VStack {
                                ForEach(GameStage.allCases, id: \.self) { gameStage in
                                    switch gameStage {
                                    case .singlePlayer, .hotPotato, .tutorial:  gameButton(gameStage: gameStage, text: gameStage.string, color: gameStage.color, icon: gameStage.icon)
                                            .padding(5)
                                    default: EmptyView()
                                    }
                                }
                            }
                        }
                    }
                default:
                    VStack {
                        backgroundImage?
                            .resizable()
                            .frame(width: frameSize*1.5, height: frameSize*1.5)
                            .onTapGesture {
                                changeEmoji()
                            }
                        Text("Match the 'Moji")
                            .font(.system(.largeTitle, design: .rounded).bold())
                        Text("Games You Play With Your FACE!")
                            .font(.system(.subheadline, design: .rounded).bold())
                        //                            .padding(.bottom, 5)
                        
                        ForEach(GameStage.allCases, id: \.self) { gameStage in
                            switch gameStage {
                            case .singlePlayer, .hotPotato, .tutorial:  gameButton(gameStage: gameStage, text: gameStage.string, color: gameStage.color, icon: gameStage.icon)
                                    .padding(5)
                            default: EmptyView()
                            }
                        }
                    }
                }
            if !arViewModel.faceTrackingEnabled {
                Rectangle().fill(.ultraThinMaterial).edgesIgnoringSafeArea(.all)
                Text("""
Thank you for downloading Match the 'Moji! 🎉 👋

Match the 'Moji is a game that is played by using your device's camera 🤳 to recognize your facial expressions 🫥.

To use this app, you must have:

An iOS device capable of performing face tracking. Such devices require either a front-facing TrueDepth camera or an A12 Bionic chip (or later). Devices include:
- iPhone X or later
- iPad Pro with FaceID
- iPhone SE (2020) or later
- iOS 11.0 or later

It appears that your device is not capable of running this app because it does not meet these technical requirements, so you will be unable to play this game 😢.
""")
                .font(.system(.subheadline, design: .rounded).bold())
                .padding()
            } else if !arViewModel.permissionGranted {
                Rectangle().fill(.ultraThinMaterial).edgesIgnoringSafeArea(.all)

                VStack {
                    Text("""
Thank you for downloading Match the 'Moji! 🎉 👋

Match the 'Moji is a game that is played by using your device's camera 🤳 to recognize your facial expressions 🫥.

In order for this game to function, it needs your permission to access to your camera 📷.

This app is not internet-enabled and does not store or transmit your face data in any way 🔒.

To enable camera access, please tap the below button to open the Settings app and toggle "Camera" to on ✅.
""")
                    .font(.system(.subheadline, design: .rounded).bold())
                    .padding()
                    Button(action: {self.settingsOpener()} ){
                        GameButtonView(text: "Open App Settings", color: .gray, icon: "gear")
                    }
                }
            }
        }
    }
    private func settingsOpener(){
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    func gameButton(gameStage: GameStage, text: String, color: Color, icon: String) -> some View {
        Button {
            arViewModel.buttonHaptic()
            arViewModel.changeGameStage(newGameStage: gameStage)
            arViewModel.gameSetup()
        } label: {
            GameButtonView(text: text, color: color, icon: icon)
        }
    }
    
    func changeEmoji() {
        arViewModel.buttonHaptic()
        backgroundImage = arViewModel.facesArray.randomElement()?.image
        withAnimation(.spring(dampingFraction: 0.5)) {
            frameSize = 130
        }
        Task {
            do {
                try await Task.sleep(nanoseconds: UInt64(0_200_000_000))
                withAnimation(.spring(dampingFraction: 0.5)) {
                    frameSize = 100
                }
                arViewModel.buttonHaptic()
            } catch {
                print ("error")
            }
        }
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(arViewModel: ARViewModel.init())
    }
}
