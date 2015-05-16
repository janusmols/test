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

    var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if motionManager.accelerometerAvailable{
            accelerometerAvalible = true
                    }
        else{
            accelerometerAvalible = false
            println("Accelerometer is not available, Your device need to have a accelerometer.")
        }
        
}
    

    
    @IBAction func GoActive(sender: AnyObject) {
        
        if accelerometerAvalible == true{
        
            Accelerometer().retrieveAccelerometerData()
            timer?.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: Accelerometer(), selector:Selector("retrieveAccelerometerData") , userInfo: nil, repeats: true)
            
            
             
        }
}
    
    @IBAction func GoOfline(sender: AnyObject) {
        
        timer?.invalidate()
    }
    
    
    
}


   
    
    










