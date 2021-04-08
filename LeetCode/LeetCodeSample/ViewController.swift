//
//  ViewController.swift
//  LeetCodeSample
//
//  Created by NuGelaliee on 12/14/20.
//

import UIKit
import MapKit

class ViewController: UIViewController {
   
    
    
    let algo = Algo()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let locationmanger = CLLocationManager()
        
        locationmanger.requestAlwaysAuthorization()
        
        locationmanger.delegate = self
        
    }
 
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        
    }
    
}
