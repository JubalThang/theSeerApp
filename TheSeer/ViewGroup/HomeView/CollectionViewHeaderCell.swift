//
//  CollectionViewHeaderCell.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import UIKit
import SDWebImage

class CollectionViewHeaderCell : UICollectionViewCell {
    
    var bibleVerseURLString : String? {
        didSet {
            if let urlString = bibleVerseURLString {
                guard let url = URL(string: urlString) else {return}
                self.dailyScriptureImg.sd_setImage(with: url)
            }
        }
    }
    
    
    
    var dailyScriptureImg : UIImageView = {
        let borderColor = UIColor(red: 53/255, green: 114/255, blue: 234/255, alpha: 1)
        let iv = UIImageView()
        iv.layer.cornerRadius = 10
        iv.image = UIImage(named: "siazaw")
//        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.borderWidth = 2
        iv.layer.borderColor = borderColor.cgColor
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
