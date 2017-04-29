//
//  RegisterViewController.swift
//  Estudo
//
//  Created by Student on 4/27/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let background = CAGradientLayer().purpleColor()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
    }
   
    
    /**sign up button***/
    @IBAction func signUpButton(sender: AnyObject) {
        
        var username = usernameTextField.text
        var email = emailTextField.text
        var password = passwordTextField.text
        
        //check if not empty, then store in parse
        if username!.isEmpty || email!.isEmpty || password!.isEmpty {
        
            //an empty field exists alert user.
        
        }else{
        
            //success, store user  in parse.
            /**begin of adding user**/
           /* var user = PFUser()
            user.username = username
            user.password = password
            user.email = email
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool!, error: NSError!) -> Void in
                if error == nil {
                    // Hooray! Let them use the app now.
                    println(succeeded)
                    
                    //take User home
                    self.performSegueWithIdentifier("takeUserHome", sender: self)
                    
                } else {
                    println(error)
                    // Show the errorString somewhere and let the user try again.
                }
            }*/
            /**end of adding user**/
            
        }
        
    }
    
    
    
}
