//
//  PublishersCollectionViewController.swift
//  Estudo
//
//  Created by Student on 4/27/16.
//  Copyright © 2016 Student. All rights reserved.
//


import UIKit

class PublishersCollectionViewController: UICollectionViewController, PublisherCollectionViewCellDelegate
{
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    // data source
    let publishers = Publishers()
    
    private let leftAndRightPaddings: CGFloat = 32.0
    private let numberOfItemsPerRow: CGFloat = 3.0
    private let heigthAdjustment: CGFloat = 30.0
    
    // MARK: - View controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = (CGRectGetWidth(collectionView!.frame) - leftAndRightPaddings) / numberOfItemsPerRow
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(width, width + heigthAdjustment)
        
        navigationItem.leftBarButtonItem = editButtonItem()
        
        // add a long press gesture to move the cell around
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "longPress:")
        collectionView?.addGestureRecognizer(longPressGestureRecognizer)
        
        let background = CAGradientLayer().purpleColor()
        background.frame = self.view.bounds
        let viewBackground = UIView()
        viewBackground.layer.insertSublayer(background, atIndex: 0)
        self.collectionView?.backgroundView = viewBackground
    }
    
    // MARK: - Delete Items
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        addButton.enabled = !editing
        if let indexPaths = collectionView?.indexPathsForVisibleItems() {
            for indexPath in indexPaths {
                collectionView?.deselectItemAtIndexPath(indexPath, animated: false)
                let cell = collectionView?.cellForItemAtIndexPath(indexPath) as! PublisherCollectionViewCell
                cell.editing = editing
            }
        }
    }
    
    func deletePublisher(publisher: Publisher)
    {
        // 1. delete publisher from the data source
        let indexPath = publishers.indexPathForPublisher(publisher)
        publishers.deleteItemsAtIndexPaths([indexPath])
        
        let layout = collectionViewLayout as! PublishersCollectionViewFlowLayout
        layout.disappearingIndexPaths = [indexPath]

        // 2. collectionView.deleteItemsAtIndexPaths([indexPath])
        UIView.animateWithDuration(1.5, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
            self.collectionView?.deleteItemsAtIndexPaths([indexPath])
            }) { (finished) -> Void in
                layout.disappearingIndexPaths = nil
        }
    }
    
    // MARK: - Add Random Items
    
    @IBAction func addButtonClicked(sender: UIBarButtonItem)
    {
        // 1. insert a new item into the data source
        let indexPath = publishers.indexPathForNewRandomPublisher()
        
        let layout = collectionViewLayout as! PublishersCollectionViewFlowLayout
        layout.appearingIndexPath = indexPath
        
        // 2. call insert item at index path so that (1) nice animation (2) doesn't lose track of scrolling
        UIView.animateWithDuration(1.5, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
            self.collectionView?.insertItemsAtIndexPaths([indexPath])
            }, completion: { finished in
                layout.appearingIndexPath = nil
        })
    }
    
    
    // MARK: - UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return publishers.numberOfSections
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return publishers.numberOfPublishersInSection(section)
    }
    
    private struct Storyboard
    {
        static let CellIdentifier = "PublisherCell"
        static let showWebView = "ShowWebView"
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Storyboard.CellIdentifier, forIndexPath: indexPath) as! PublisherCollectionViewCell
        
        cell.publisher = publishers.publisherForItemAtIndexPath(indexPath)
        cell.editing = editing
        cell.delegate = self
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView
    {
        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "SectionHeader", forIndexPath: indexPath) as! SectionHeaderView
        
        if let publisher = publishers.publisherForItemAtIndexPath(indexPath) {
            headerView.publisher = publisher
        }
        
        headerView.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(CGFloat.abs(0.25))
        
        return headerView
    }
    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        if !editing {
            let publisher = publishers.publisherForItemAtIndexPath(indexPath)
            self.performSegueWithIdentifier(Storyboard.showWebView, sender: publisher)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Storyboard.showWebView {
            let webViewController = segue.destinationViewController as! WebViewController
            let publisher = sender as! Publisher
            webViewController.publisher = publisher
        }
    }
    
    // MARK: - Dragging the Cell
    
    private var snapshot: UIView?
    private var sourceIndexPath: NSIndexPath?
    
    private func updateSnapshotView(center: CGPoint, transform: CGAffineTransform, alpha: CGFloat)
    {
        if let snapshot = snapshot {
            snapshot.center = center
            snapshot.transform = transform
            snapshot.alpha = alpha
        }
    }
    
    func longPress(gestureRecognizer: UILongPressGestureRecognizer)
    {
        if !editing {
            let location = gestureRecognizer.locationInView(collectionView)
            let indexPath = collectionView?.indexPathForItemAtPoint(location)
            
            switch gestureRecognizer.state
            {
            case .Began:
                print("began")
                if let indexPath = indexPath {
                    sourceIndexPath = indexPath
                    let cell = collectionView?.cellForItemAtIndexPath(indexPath) as! PublisherCollectionViewCell
                    
                    snapshot = cell.snapshot
                    updateSnapshotView(cell.center, transform: CGAffineTransformIdentity, alpha: 0.0)
                    collectionView?.addSubview(snapshot!)
                    
                    UIView.animateWithDuration(0.15, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: .CurveEaseInOut, animations: { () -> Void in
                        self.updateSnapshotView(cell.center, transform: CGAffineTransformMakeScale(1.05, 1.05), alpha: 0.95)
                        cell.dragging = true
                        }, completion: nil)
                }
            case .Changed:
                self.snapshot?.center = location
                if let indexPath = indexPath {
                    // change the order of the publisher in the datasource
                    publishers.movePublisherFromIndexPath(sourceIndexPath!, toIndexPath: indexPath)
                    collectionView?.moveItemAtIndexPath(sourceIndexPath!, toIndexPath: indexPath)
                    sourceIndexPath = indexPath
                }

            default:
                let cell = collectionView?.cellForItemAtIndexPath(sourceIndexPath!) as! PublisherCollectionViewCell
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.updateSnapshotView(cell.center, transform: CGAffineTransformIdentity, alpha: 0.0)
                    cell.dragging = false
                    }, completion: { (finished) -> Void in
                        self.snapshot?.removeFromSuperview()
                        self.snapshot = nil
                })
            }
            
            
        }
    }
    
    
}

























