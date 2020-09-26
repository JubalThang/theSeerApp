//
//  GradientBackground.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import UIKit

extension UIView {
    func addGradientToView(firstColor: UIColor, secondColor : UIColor)
    {
        //gradient layer
        let gradientLayer = CAGradientLayer()

        //define colors
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]

        //define locations of colors as NSNumbers in range from 0.0 to 1.0
        //if locations not provided the colors will spread evenly
        gradientLayer.locations = [0.0, 0.8]

        //define frame
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = 10

        //insert the gradient layer to the view layer
        //            view.layer.insertSublayer(gradientLayer, at: 0)
        self.layer.addSublayer(gradientLayer)
//        backgroundColor = UIColor.orange
    }
}
