//
//  ViewController.swift
//  Estudo
//
//  Created by Student on 4/27/16.
//  Copyright © 2016 Student. All rights reserved.
//


import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButton(sender: AnyObject) {
       
       var username = usernameTextField.text
        var password = passwordTextField.text
        
        if username!.isEmpty || password!.isEmpty {
            //empty let the user know
        } else {
            //log in user inparse
           /* PFUser.logInWithUsernameInBackground(username, password: password, block: {
                (user: PFUser!, error: NSError!) -> Void in
                if user != nil {
                    //take user home
                    self.performSegueWithIdentifier("loginSuccessGoHome", sender: self)
                    
                }else{
                    //user is nil, alert user
                    var errorAlert = UIAlertController(title: "Oops!", message: "Error. try again!", preferredStyle: UIAlertControllerStyle.Alert)
                    errorAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction!) -> Void in
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }))
                    self.presentViewController(errorAlert, animated: true, completion: nil)
                }
            })
            
        }*/
        
        
    }
 

    func viewDidLoad() {
        super.viewDidLoad()
        
        let background = CAGradientLayer().purpleColor()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
        //anytime this page loads, clear the user.
       // PFUser.logOut()
        
        
   
        
    }

    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    }
}