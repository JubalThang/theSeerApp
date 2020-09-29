//
//  Extensions.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import SwiftUI

extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Hide NavigationBar onSwipe
//        hidesBarsOnSwipe = true
        
        // other Navigation bar customizations
        navigationBar.standardAppearance.shadowColor = .clear
        navigationBar.scrollEdgeAppearance?.shadowColor = .clear
    }
}


extension UITabBarController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        let standardAppearance = UITabBarAppearance()
        
        standardAppearance.backgroundColor = .white
        standardAppearance.shadowColor = .white
        
        tabBar.standardAppearance = standardAppearance
    }
}

extension String {
    func generate() -> [String] {
        if self.contains("|") {
            return self.components(separatedBy: "|")
        } else {
            return []
        }
    }
}

extension Date {
    
    func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: self)
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusModifier(radius: radius, corners: corners))
    }
}

extension Array {
    func chunked(int size : Int) -> [Element] {
        return Array(self[0 ..< size])
    }
}
