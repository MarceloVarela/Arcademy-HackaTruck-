//
//  StatusDetailViewController.swift
//  Estudo
//
//  Created by Student on 4/27/16.
//  Copyright © 2016 Student. All rights reserved.
//


import UIKit

class StatusDetailViewController: UIViewController {
    
    //items to receive
    var status: String?

    @IBOutlet weak var statusDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let background = CAGradientLayer().purpleColor()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
        
        statusDetailLabel.text = status
        statusDetailLabel.numberOfLines = 0
        statusDetailLabel.sizeToFit()
        
        
    }
}
