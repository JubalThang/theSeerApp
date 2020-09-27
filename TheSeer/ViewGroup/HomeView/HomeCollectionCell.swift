//
//  HomeCollectionCell.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import UIKit

class HomeCollectionCell : UICollectionViewCell {
    
    var pastor : Pastor? {
        didSet {
            if let pastor = pastor {
                self.nameLbl.text = pastor.name
                
                guard let url = URL(string: pastor.img_url) else {return}
                
                self.imageView.sd_setImage(with: url)
            }
        }
    }
    
    var nameLbl : UILabel = {
        let l = UILabel()
        l.text = "Rev.Zaw Lin Aung"
        l.textAlignment = .right
        l.textColor = .white
        l.font = .systemFont(ofSize: 14, weight: .semibold)
        return l
    }()
    
    private let nameLblBackround : UIView = {
        let l = UIView()
        l.layer.cornerRadius = 10
        return l
     }()
     
    
    var imageView : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 10
        iv.image = UIImage(named: "siazaw")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        addImageView()
    }
    
    func addImageView() {
        addSubview(imageView)
        imageView.anchor(top: topAnchor, trailing: trailingAnchor, bottom: bottomAnchor, leading: leadingAnchor, padding: .init(top: 0, left: 2, bottom: 0, right: 2))
        addNameLblBackground()
    }
    
    
    func addNameLblBackground() {
        addSubview(nameLblBackround)
        nameLblBackround.anchor(top: nil, trailing: imageView.trailingAnchor, bottom: imageView.bottomAnchor, leading: imageView.leadingAnchor)
        nameLblBackround.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        DispatchQueue.main.async {
            self.nameLblBackround.addGradientToView(firstColor : UIColor.clear, secondColor: UIColor.black)
        }
        addNameLabel()
    }
    
    func addNameLabel() {
        addSubview(nameLbl)
        nameLbl.anchor(top: nil, trailing: nameLblBackround.trailingAnchor, bottom: nameLblBackround.bottomAnchor, leading: nameLblBackround.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10))
        nameLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
