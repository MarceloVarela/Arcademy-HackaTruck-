//
//  AulaTableViewCell.swift
//  Estudo
//
//  Created by Student on 4/27/16.
//  Copyright © 2016 Student. All rights reserved.
//


import UIKit

class SectionHeaderView: UICollectionReusableView
{
        
    @IBOutlet weak var sectionLabel: UILabel!
    
    var publisher: Publisher? {
        didSet {
            sectionLabel.text = publisher?.section.uppercaseString
        }
    }
    
    
}






















