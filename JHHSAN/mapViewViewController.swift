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


class mapViewViewController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    func LocationManger(manager:CLLocationManager, didUpdateLocations Locations: [CLLocation]){
        print (locationManager.location)
        
    }
    
    let coordinate = CLLocationCoordinate2DMake(42.103713, -87.958936)
    let coordinate2 = CLLocationCoordinate2DMake(42.0790315, -87.94952610000001)
    let coordinate3 = CLLocationCoordinate2DMake(42.1259361, -87.93865570000003 )
    let coordinate4 = CLLocationCoordinate2DMake(42.0112193, -87.99767250000002)
    let coordinate5 = CLLocationCoordinate2DMake(42.1405187, -87.98371370000001)
    let coordinate6 = CLLocationCoordinate2DMake(42.0649256, -88.01569549999999)
    let coordinate7 = CLLocationCoordinate2DMake(42.0463368, -87.9735968)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        //NSLocationAlwaysUsageDescription
        mapView.delegate = self
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        mapView.userLocation.title = "My Location"
        setCenterOfMapToLocation(location: coordinate2)
        addPinAnnotationToMapViewJHHS(location: coordinate)
        addPinAnnotationToMapViewPHS(location: coordinate2)
        addPinAnnotationToMapViewWHS(location: coordinate3)
        addPinAnnotationToMapViewEGH(location: coordinate4)
        addPinAnnotationToMapViewBGH(location: coordinate5)
        addPinAnnotationToMapViewRMH(location: coordinate6)
        addPinAnnotationToMapViewFVH(location: coordinate7)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locationManager.location)
    }
    func setCenterOfMapToLocation (location: CLLocationCoordinate2D){
        let span = MKCoordinateSpan(latitudeDelta: 0.20, longitudeDelta: 0.20)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    func addPinAnnotationToMapViewJHHS(location: CLLocationCoordinate2D){
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "John Hersey High School"
        mapView.addAnnotation(annotation)
    }
    func addPinAnnotationToMapViewPHS(location: CLLocationCoordinate2D){
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = location
        annotation2.title = "Prospect High School"
        mapView.addAnnotation(annotation2)
    }
    func addPinAnnotationToMapViewWHS(location: CLLocationCoordinate2D){
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = location
        annotation3.title = "Wheeling High School"
        mapView.addAnnotation(annotation3)
    }
    func addPinAnnotationToMapViewEGH(location: CLLocationCoordinate2D){
        let annotation4 = MKPointAnnotation()
        annotation4.coordinate = location
        annotation4.title = "Elk Grove High School"
        mapView.addAnnotation(annotation4)
    }
    func addPinAnnotationToMapViewBGH(location: CLLocationCoordinate2D){
        let annotation5 = MKPointAnnotation()
        annotation5.coordinate = location
        annotation5.title = "Buffalo Grove High School"
        mapView.addAnnotation(annotation5)
    }
    func addPinAnnotationToMapViewRMH(location: CLLocationCoordinate2D){
        let annotation6 = MKPointAnnotation()
        annotation6.coordinate = location
        annotation6.title = "Rolling Meadows High School"
        mapView.addAnnotation(annotation6)
    }
    func addPinAnnotationToMapViewFVH(location: CLLocationCoordinate2D){
        let annotation7 = MKPointAnnotation()
        annotation7.coordinate = location
        annotation7.title = "Forest View High School"
        mapView.addAnnotation(annotation7)
        
    }
}



