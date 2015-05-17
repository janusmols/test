//
//  loginScreen.swift
//  Secure your Iphone
//
//  Created by Janus Broch Mols on 16/05/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class loginScreen: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var backgroundImage: UIImageView!


    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var login: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        //The back button for the sign up screen is "log in"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Log in", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        
        //call the blur effect func
        addEffect()
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
    
    
    @IBAction func Login(sender: AnyObject) {
        
        var userEmail = emailTextField.text
        var userPasword = passwordTextField.text
        
        PFUser.logInWithUsernameInBackground(userEmail, password:userPasword) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                //login is succesfull
                
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn")
                NSUserDefaults.standardUserDefaults().synchronize()
                self.dismissViewControllerAnimated(true, completion: nil)
                
                //The back button for the Home screen is "log out"
                self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Log out", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
                //Push to HomeViewcontroller
                self.performSegueWithIdentifier("pushToHomeScreen", sender: self)
                
                
            } else {
                println("could not find user")
            }
        }
        
        
}


}
