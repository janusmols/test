//
//  SignUpScreen.swift
//  Secure your Iphone
//
//  Created by Janus Broch Mols on 16/05/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class SignUpScreen: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var backgroundImage: UIImageView!

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
        
        addEffect()
}
    
    func addEffect()
    {
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

    
    
    @IBAction func SignUpBtn(sender: AnyObject) {
        
        var userEmail = emailTextField.text
        var userPassword = passwordTextField.text
        var userRepeatPassword = repeatPasswordTextField.text
        
        if userEmail != "" && userPassword != "" && userRepeatPassword != "" {
         
        } else {
            //self.messageLabel.text = "All Fields Required"
        }
        
        if(userPassword != userRepeatPassword){
            //displayMyAlertMessage("Passwords do not match")
            return
        }

        //store data
        var user:PFUser = PFUser()
        user.username = userEmail
        user.password = userPassword
        user.email = userEmail
        
        user.signUpInBackgroundWithBlock {
            (succeeded, error) -> Void in
            
            //user successfuly registered
            var myAlert = UIAlertController(title: "Alert", message: "Registration is succesful. Thank you!", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){ action in self.dismissViewControllerAnimated(true, completion:nil)
        }
            
            myAlert.addAction(okAction)
            self.presentViewController(myAlert, animated: true, completion: nil)

}
    
    
    func userSignUp() {
    
        
        
        
        
}
    



}
}
