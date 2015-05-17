//
//  loginScreen.swift
//  Secure your Iphone
//
//  Created by Janus Broch Mols on 16/05/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class loginScreen: UIViewController {
    @IBOutlet weak var backgroundImage: UIImageView!


    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var login: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addEffect()
    }

    func addEffect()
    {
        var effect =  UIBlurEffect(style: UIBlurEffectStyle.Light)
        
        var effectView  = UIVisualEffectView(effect: effect)
        
        effectView.frame  = CGRectMake(0, 0, 2000, 2000)
        
        backgroundImage.addSubview(effectView)
        
        
        
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
                
             self.performSegueWithIdentifier("pushToHomeScreen", sender: self)
                
            } else {
                println("could not find user")
            }
        }
        
        
}


}
