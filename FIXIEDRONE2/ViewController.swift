//
//  ViewController.swift
//  FIXIEDRONE2
//
//  Created by Jirayu Promsongwong on 10/19/2559 BE.
//  Copyright © 2559 KMITL. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var welcomeButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = FIRAuth.auth()?.currentUser
        {
            self.logoutButton.alpha = 1.0
            self.userNameLabel.text = user.email
            self.welcomeButton.alpha = 1.0
        }
        else
        {
            self.logoutButton.alpha = 0.0
            self.userNameLabel.text = ""
            self.welcomeButton.alpha = 0.0
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func createAccountAction(_sender: AnyObject)
    {
        if self.emailField.text == "" || self.passwordField.text! == ""
        {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email and password.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(alertAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            
            FIRAuth.auth()?.createUser(withEmail: self.emailField.text!, password: self.passwordField.text!, completion: {(user,error) in
                
                if error == nil
                {
                    self.logoutButton.alpha = 1.0
                    self.welcomeButton.alpha = 1.0
                    self.userNameLabel.text = user?.email
                    self.emailField.text = ""
                    self.passwordField.text = ""
                    
                }
                else
                {
                    let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(alertAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
                
            })
            
        }
        
        
    }
    @IBAction func loginAction(_sender: AnyObject)
    {
        
        
        if self.emailField.text == "" || self.passwordField.text! == ""
        {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email and password.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(alertAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            FIRAuth.auth()?.signIn(withEmail: self.emailField.text!, password: self.passwordField.text!, completion: { (user,error) in
                if error == nil
                {
                    self.logoutButton.alpha = 1.0
                    self.welcomeButton.alpha = 1.0
                    self.userNameLabel.text = user?.email
                    self.emailField.text = ""
                    self.passwordField.text = ""
                    
                }
                else
                {
                    let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(alertAction)
                    self.present(alertController, animated: true, completion: nil)
                }

                
                
            })
        }
        
    }
    @IBAction func logoutAction(_sender: AnyObject)
    {
        try! FIRAuth.auth()?.signOut()
        self.userNameLabel.text = ""
        self.logoutButton.alpha = 0.0
        self.welcomeButton.alpha = 0.0
        self.emailField.text = ""
        self.passwordField.text = ""
        
    }

    }
    

    
    
    
    
    
    
    
    
    



