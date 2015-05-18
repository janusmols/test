//
//  ViewController.swift
//  Secure your Iphone
//
//  Created by Janus Broch Mols on 16/05/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit
import CoreMotion

class HomeScreen: UIViewController {
    var accelerometerAvalible: Bool?
    lazy var motionManager = CMMotionManager()

    @IBOutlet weak var goActiveBtn: UIButton!
    @IBOutlet weak var goOflineBtn: UIButton!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if motionManager.accelerometerAvailable{
            accelerometerAvalible = true
                    }
        else{
            accelerometerAvalible = false
            println("Accelerometer is not available, Your device need to have a accelerometer.")
            var myAlert = UIAlertController(title: "accelerometer is a requirement", message: "Your device ned a accelerometer.", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){ action in self.dismissViewControllerAnimated(true, completion:nil)
            }
            
            myAlert.addAction(okAction)
            self.presentViewController(myAlert, animated: true, completion: nil)

        }
        
}
    

    
    @IBAction func GoActive(sender: AnyObject) {
        
        if accelerometerAvalible == true{
        
            Accelerometer().retrieveAccelerometerData(false)

        }
}
    
    

    
    @IBAction func GoOfline(sender: AnyObject) {
       Accelerometer().retrieveAccelerometerData(true)
        
    }
    
    
    
}


   
    
    










