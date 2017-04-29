//
//  CAGradientLayer+Convience.swift
//  GradientBackground
//
//  Created by Student on 4/28/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    func purpleColor() -> CAGradientLayer {
    
        let topColor = UIColor (red: (140/225.0), green: (7/225.0), blue: (107/225.0), alpha: 1)
        let bottomColor = UIColor(red: (51/225.0), green: (14/225.0), blue: (66/225.0), alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        let gradientLocations: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer ()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
    }

}
