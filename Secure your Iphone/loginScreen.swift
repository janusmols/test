//
//  loginScreen.swift
//  Secure your Iphone
//
//  Created by Janus Broch Mols on 16/05/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class loginScreen: UIViewController, UITextFieldDelegate {
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var backgroundImage: UIImageView!


    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var login: UIButton!
    
    @IBOutlet weak var rememberMyPasswordSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        //The back button for the sign up screen is "log in"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Log in", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        
        //call the blur effect func
        addEffect()
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated:true)
        
        //emailTextField.text = userDefaults.valueForKey("savedUserEmail") as! String
       // passwordTextField.text = userDefaults.valueForKey("savedUserPassword") as! String
    }
    
    func addEffect()
    {
        //add blur to background
        var effect =  UIBlurEffect(style: UIBlurEffectStyle.Light)
        
        var effectView  = UIVisualEffectView(effect: effect)
        
        effectView.frame  = CGRectMake(0, 0, 2000, 2000)
        
        backgroundImage.addSubview(effectView)

        
}
    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let touch = touches.first as? UITouch {
            self.view.endEditing(true)
        }
        super.touchesBegan(touches , withEvent:event)
    }
    
    @IBAction func Switchaction(sender: AnyObject) {
        if(!rememberMyPasswordSwitch.on){
            self.userDefaults.setValue("", forKey: "savedUserEmail")
            self.userDefaults.synchronize() // don't forget this!!!!
            //save password
            self.userDefaults.setValue("", forKey: "savedUserPassword")
            self.userDefaults.synchronize() // don't forget this!!!!
            emailTextField.text = userDefaults.valueForKey("savedUserEmail") as! String
            passwordTextField.text = userDefaults.valueForKey("savedUserPassword") as! String

        }
    }
    
    @IBAction func Login(sender: AnyObject) {
        
        if(emailTextField.text != "" && passwordTextField.text != ""){
        var userEmail = emailTextField.text
        var userPassword = passwordTextField.text
        
        PFUser.logInWithUsernameInBackground(userEmail, password:userPassword) {
            (user: PFUser?, error: NSError?) -> Void in
            
            if user == nil{
            println("no user")
                var myAlert = UIAlertController(title: "Could not find user", message: "Log in failed.", preferredStyle: UIAlertControllerStyle.Alert)
                
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){ action in self.dismissViewControllerAnimated(true, completion:nil)
                }
                
                myAlert.addAction(okAction)
                self.presentViewController(myAlert, animated: true, completion: nil)
                

            }
            
            if user != nil {
                //login is succesfull
                
                if(self.rememberMyPasswordSwitch.on){
                    //Save email
                    
                    self.userDefaults.setValue(userEmail, forKey: "savedUserEmail")
                    self.userDefaults.synchronize() // don't forget this!!!!
                    //save password
                    self.userDefaults.setValue(userPassword, forKey: "savedUserPassword")
                    self.userDefaults.synchronize() // don't forget this!!!!
                    
                    println(self.userDefaults.valueForKey("savedUserEmail"))
                    println(self.userDefaults.valueForKey("savedUserPassword"))
                }
                
                //The back button for the Home screen is "log out"
                self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Log out", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
                //Push to HomeViewcontroller
                self.performSegueWithIdentifier("pushToHomeScreen", sender: self)
                
                
            } else {
                println("could not find user")
            }
        }
        
        
        }
        
        if(emailTextField.text == "" || passwordTextField.text == ""){
            var myAlert = UIAlertController(title: "All fields required", message: "Log in failed.", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){ action in self.dismissViewControllerAnimated(true, completion:nil)
            }
            
            myAlert.addAction(okAction)
            self.presentViewController(myAlert, animated: true, completion: nil)

        }
   }
}
