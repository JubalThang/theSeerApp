//
//  CornerRadiusModifer.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import SwiftUI

struct CornerRadiusModifier : ViewModifier {
    var radius : CGFloat
    var corners : UIRectCorner
    
    struct CornerRadiusShape : Shape {
        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners
        
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }
    
    func body(content: Content) -> some View {
        content
        .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}
