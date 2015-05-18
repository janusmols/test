//
//  Accelerometer.swift
//  Secure your Iphone
//
//  Created by Janus Broch Mols on 16/05/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import Foundation
import CoreMotion

class Accelerometer {
    
    lazy var motionManager = CMMotionManager()
    var timer: NSTimer?
    var x:Double = 0.000
    var y:Double = 0.000
    var z:Double = 0.000
    
    
    func retrieveAccelerometerData(stopUpdating: Bool){
    
        if(stopUpdating == false){
    let queue = NSOperationQueue()
    motionManager.startAccelerometerUpdatesToQueue(queue, withHandler:
    {(data: CMAccelerometerData!, error: NSError!) in
    /*
    println("X = \(data.acceleration.x)")
    println("Y = \(data.acceleration.y)")
    println("Z = \(data.acceleration.z)")
    */
    self.x = data.acceleration.x
    self.y = data.acceleration.y
    self.z = data.acceleration.z
    println("updating")
        if self.x > 0.09 || self.y > 0.09 || self.z > 0.09{
            println("action")
            self.motionManager.stopAccelerometerUpdates()
        }

        if(stopUpdating == true){
            
            self.motionManager.stopAccelerometerUpdates()
            println("stopUpdating")
        }

    }
    )
    }

            }


    func goOfline(){
        self.motionManager.stopAccelerometerUpdates()
        println("stopUpdating")
}


}