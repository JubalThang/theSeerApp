//
//  PlayerViewOverlayButton.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import SwiftUI
struct PlayVideoOverlayButton : ViewModifier {
    @Binding var isPlaying : Bool
    func body(content: Content) -> some View {
        ZStack {
            content
            Button(action: {
                self.isPlaying.toggle()
            }) {
                if !isPlaying {
                    PlayPauseViewBuilder() {
                        Image(systemName: "play")
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}
