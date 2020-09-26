//
//  CollectionViewHeaderCell.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import UIKit
class CollectionViewHeaderCell : UICollectionViewCell {
    
    var dailyScriptureImg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 10
        iv.image = UIImage(named: "siazaw")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        addScriptureImg()
    }
    
    func addScriptureImg() {
        addSubview(dailyScriptureImg)
        
        dailyScriptureImg.anchor(top: topAnchor, trailing: trailingAnchor, bottom: bottomAnchor, leading: leadingAnchor, size: .zero, padding: .init(top: 2, left: 2, bottom: 2, right: 2))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
