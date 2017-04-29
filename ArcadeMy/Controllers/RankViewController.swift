//
//  RankViewController.swift
//  Rank
//
//  Created by Student on 4/28/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class RankViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var rankSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var rankMenuTable: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var retorno = 4
//        switch self.segmentedControl.selectedSegmentIndex {
//        case 0:
//            retorno = self.Nacional.count
//        case 1:
//            retorno = self.Municipal.count
//        case 2:
//            retorno = self.Academico.count
//        default:
//            retorno = self.Amigos.count
//        }
        return retorno
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("rankCellIdentifier", forIndexPath: indexPath) as! RankTableViewCell
        let indice = indexPath.row+1
        cell.position.text = String(indice)+" -"
        cell.fotoPerfil = UIImageView(image: UIImage(named: String(indice)))
        cell.nomePerfil.text = "Nome "+String(indice)
        cell.score.text = String(1000/indice)+" pts."
        return cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rankMenuTable.delegate = self
        self.rankMenuTable.dataSource = self
        
        self.rankMenuTable.reloadData()

        let background = CAGradientLayer().purpleColor()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
