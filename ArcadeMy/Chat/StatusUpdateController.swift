//
//  StatusUpdateController.swift
//  Estudo
//
//  Created by Student on 4/27/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class StatusUpdateController: UIViewController {

    @IBOutlet weak var statusUpdateTextField: UITextField!
    
    @IBAction func updateStatusBtn(sender: AnyObject) {
        
        var status = statusUpdateTextField.text
        
        if status!.isEmpty {
                //the status is empty
        }else {
     /*       //store the status in parse.
            var statusUpdate = PFObject(className: "Status")
            statusUpdate["newStatus"] = status
            statusUpdate["user"] = PFUser.currentUser().username
            statusUpdate.saveInBackgroundWithBlock({
                (isSuccesful: Bool!, error: NSError!) -> Void in
                if error == nil {
                    //success updating status
                    println(isSuccesful)
                }else {
                    //there was an error
                    println(error)
                }
                
            })
        }*/
        
        
        
    }
    
    
    }
}