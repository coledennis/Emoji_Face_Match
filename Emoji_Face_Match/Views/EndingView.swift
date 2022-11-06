//
//  EndingView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 10/30/22.
//

import SwiftUI

struct EndingView: View {
    @ObservedObject var arViewModel : ARViewModel
    var body: some View {
        VStack {
            Text("Ya did it")
            Text("Score: \(arViewModel.score)")
        }
    }
}

struct EndingView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView(arViewModel: ARViewModel.init())
    }
}
