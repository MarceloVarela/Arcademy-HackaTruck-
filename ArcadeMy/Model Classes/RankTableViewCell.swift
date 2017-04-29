//
//  RankTableViewCell.swift
//  Rank
//
//  Created by Student on 4/28/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class RankTableViewCell: UITableViewCell {

    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var nomePerfil: UILabel!
    @IBOutlet weak var fotoPerfil: UIImageView!
    @IBOutlet weak var position: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
