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
        
        hidesBarsOnSwipe = true
        
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
