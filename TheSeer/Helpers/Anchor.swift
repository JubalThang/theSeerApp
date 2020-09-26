//
//  Anchor.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, size: CGSize = CGSize.zero ,padding: UIEdgeInsets = UIEdgeInsets.zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let t = top {
            topAnchor.constraint(equalTo: t, constant: padding.top).isActive = true
        }
        if let tra = trailing {
            trailingAnchor.constraint(equalTo: tra, constant: -padding.right).isActive = true
        }
        if let b = bottom {
            bottomAnchor.constraint(equalTo: b, constant: -padding.bottom).isActive = true
        }
        if let l = leading {
            leadingAnchor.constraint(equalTo: l, constant: padding.left).isActive = true
        }
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
