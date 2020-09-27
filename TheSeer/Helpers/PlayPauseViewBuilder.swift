//
//  PlayerButtonViewBuinder.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import SwiftUI

struct PlayPauseViewBuilder<Content : View> : View {
    
    var content : Content
    
    init(@ViewBuilder content : () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 20))
            .padding()
            .background(Circle().foregroundColor(Color.black.opacity(0.4)))
    }
}
