//
//  AulaTableViewCell.swift
//  Estudo
//
//  Created by Student on 4/27/16.
//  Copyright © 2016 Student. All rights reserved.
//


import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var menuTable: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    var listaMaterias:[String] = [String]()
    var listaAulas:[String] = [String]()
    var listaAtividades:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setBackground()
        
        self.menuTable.backgroundColor = UIColor.clearColor()
        self.menuTable.delegate = self
        self.menuTable.dataSource = self
        self.menuTable.rowHeight = 90.0
        self.segmentedControl.selectedSegmentIndex = 0
        self.selectedControl(self.segmentedControl)

    }
    
    func setBackground() {
        let background = CAGradientLayer().purpleColor()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
        
    }
    
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        self.setBackground()
    }
    
    
    @IBAction func selectedControl(sender: AnyObject) {
        
        switch self.segmentedControl.selectedSegmentIndex {
        case 0:
            self.listaMaterias = [String]()
            self.listaMaterias.append("Matematica")
            self.listaMaterias.append("Geografia")
            self.listaMaterias.append("Portugues")
            self.listaMaterias.append("Ingles")
            self.listaMaterias.append("Historia")
        case 1:
            self.listaAulas = [String]()
            self.listaAulas.append("Aula 1")
            self.listaAulas.append("Aula 2")
            self.listaAulas.append("Aula 3")
            self.listaAulas.append("Aula 4")
            self.listaAulas.append("Aula 5")
        default:
            self.listaAtividades = [String]()
            self.listaAtividades.append("Atividade 1")
            self.listaAtividades.append("Atividade 2")
            self.listaAtividades.append("Atividade 3")
            self.listaAtividades.append("Atividade 4")
            self.listaAtividades.append("Atividade 5")
        }
        self.menuTable.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var retorno = 0
        switch self.segmentedControl.selectedSegmentIndex {
        case 0:
            retorno = self.listaMaterias.count
        case 1:
            retorno = self.listaAulas.count
        default:
            retorno = self.listaAtividades.count
        }
        return retorno
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell?
        
        switch self.segmentedControl.selectedSegmentIndex {
        case 0:
            cell = tableView.dequeueReusableCellWithIdentifier("materiaIdentifier", forIndexPath: indexPath)
            (cell as! MateriasTableViewCell).matLabel.text = self.listaMaterias[indexPath.row]
        case 1:
            cell = tableView.dequeueReusableCellWithIdentifier("aulaIdentifier", forIndexPath: indexPath)
            (cell as! AulaTableViewCell).aulaLabel.text = self.listaAulas[indexPath.row]
        default:
            cell = tableView.dequeueReusableCellWithIdentifier("atividadeIdentifier", forIndexPath: indexPath)
            (cell as! AtividadeTableViewCell).atividadeLabel.text = self.listaAtividades[indexPath.row]
            
        }
        cell!.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(CGFloat.abs(0.01))
        let cellBGView = UIView()
        cellBGView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(CGFloat.abs(0.1))
        cell!.selectedBackgroundView = cellBGView
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
