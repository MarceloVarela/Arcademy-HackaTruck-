//
//  PublisherCollectionViewCell.swift
//  Estudo
//
//  Created by Student on 4/27/16.
//  Copyright © 2016 Student. All rights reserved.
//


import UIKit

protocol PublisherCollectionViewCellDelegate
{
    func deletePublisher(publisher: Publisher)
}

class PublisherCollectionViewCell: UICollectionViewCell
{
    
    @IBOutlet weak var publisherImageView: UIImageView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var publisherTitleLabel: UILabel!
    @IBOutlet weak var closeButtonView: UIVisualEffectView!
    
    var delegate: PublisherCollectionViewCellDelegate?
    
    var publisher: Publisher? {
        didSet {
            updateUI()
        }
    }
    
    var editing: Bool = false {
        didSet {
            closeButtonView.hidden = !editing
        }
    }
    
    @IBAction func deleteButtonClicked()
    {
        delegate?.deletePublisher(publisher!)
    }
    
    func updateUI()
    {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 3.0
        publisherImageView.image = publisher?.image
        publisherTitleLabel.text = publisher?.title
        
        closeButtonView.layer.masksToBounds = true
        closeButtonView.layer.cornerRadius = closeButtonView.bounds.width / 2
    }
    
    
    var snapshot: UIView {
        get {
            let snapshot = snapshotViewAfterScreenUpdates(true)
            let layer = snapshot.layer
            layer.masksToBounds = false
            layer.shadowOffset = CGSize(width: -2.5, height: 0.0)
            layer.shadowRadius = 3.0
            layer.shadowOpacity = 0.4
            return snapshot
        }
    }
    
    var dragging: Bool = false {
        didSet {
            let alpha: CGFloat = dragging ? 0.0 : 1.0
            publisherImageView.alpha = alpha
            publisherTitleLabel.alpha = alpha
            visualEffectView.alpha = alpha
        }
    }
    
}































