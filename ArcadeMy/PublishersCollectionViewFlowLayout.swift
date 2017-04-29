//
//  PublishersCollectionViewFlowLayout.swift
//  Estudo
//
//  Created by Student on 4/27/16.
//  Copyright © 2016 Student. All rights reserved.
//


import UIKit

class PublishersCollectionViewFlowLayout: UICollectionViewFlowLayout
{
    
    // hold the index path of the item being inserted
    var appearingIndexPath: NSIndexPath?
    
    // holde the index paths of the items being deleted
    var disappearingIndexPaths: [NSIndexPath]?
    
    // this method provies the layout with the initial layout attributes for items being inserted into the collection view
    override func initialLayoutAttributesForAppearingItemAtIndexPath(itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        // a set of layout attributes for the item at the given index path
        // these are the default attributes
        let attributes = super.initialLayoutAttributesForAppearingItemAtIndexPath(itemIndexPath)
        
        // we will manipulate them if the index path matches the index path of the item being inserted
        if let indexPath = appearingIndexPath { // unwrap the appearing index path
            if let attributes = attributes {    // the super method returns optional so also upwraps
                if indexPath == itemIndexPath { // check if the current indexpath is the same as the one inserted
                    
                    // update the item position, scale..
                    attributes.alpha = 1.0
                    //                    attributes.center = CGPoint(x: CGRectGetWidth(collectionView!.frame) - 23.5, y: -24.5)
                    
                    attributes.transform = CGAffineTransformMakeScale(0.15, 0.15)
                    attributes.zIndex = 99  // make this item appear above all other items
                }
            }
        }
        
        return attributes   // next, we need to tell our collection view to use the collection view flow layout
    }
    
    // change the final state of the deleted items' attributes
    override func finalLayoutAttributesForDisappearingItemAtIndexPath(itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = super.finalLayoutAttributesForDisappearingItemAtIndexPath(itemIndexPath)
        
        if let disappearingIndexPaths = disappearingIndexPaths {
            for indexPath in disappearingIndexPaths {
                if indexPath == itemIndexPath {
                    if let attributes = attributes {
                        
                        attributes.alpha = 0.0
                        attributes.transform = CGAffineTransformMakeScale(0.1, 0.1)
                        attributes.zIndex = -1
                        
                    }
                }
            }
        }
        
        return attributes
    }
    
}


















