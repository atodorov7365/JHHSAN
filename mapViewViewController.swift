//
//  mapViewViewController.swift
//  
//
//  Created by student3 on 12/6/16.
//
//

import UIKit
import MapKit
import CoreLocation


class mapViewViewController: UITableViewController {
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        mapView.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        mapView.userLocation.title = "Location"
        
        //Location services
        
    }
    func LocationManger(manager:CLLocationManager, didUpdateLocations Locations: [CLLocation]){
        print (locationManager.location)
    }
}


