//
//  GameButtonView.swift
//  Emoji_Face_Match
//
//  Created by Cole Dennis on 10/30/22.
//

import SwiftUI

struct GameButtonView: View {
    var text: String
    var color: Color
    var icon: String
    var body: some View {
        Label(text, systemImage: icon)
            .frame(minWidth: 150)
            .foregroundColor(.primary)
            .font(.system(.headline, design: .rounded).bold())
            .padding()
            .background(RoundedRectangle(cornerRadius: 15).fill(color.opacity(0.5)))
    }
}

struct GameButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GameButtonView(text: "text", color: .red, icon: "person")
    }
}
