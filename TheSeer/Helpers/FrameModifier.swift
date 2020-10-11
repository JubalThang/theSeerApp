//
//  FrameModifier.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct FrameModifier : ViewModifier {
    var imgeUrl : String
    let pictureSize : CGFloat = 2.4
    func body(content: Content) -> some View {
        ZStack {
            content
            WebImage(url: URL(string: imgeUrl))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width / pictureSize , height: UIScreen.main.bounds.width / pictureSize )
                .clipShape(Circle())
        }
    }
}
