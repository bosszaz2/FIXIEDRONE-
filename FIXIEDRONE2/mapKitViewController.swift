//
//  mapKitViewController.swift
//  FIXIEDRONE2
//
//  Created by Jirayu Promsongwong on 11/9/2559 BE.
//  Copyright © 2559 KMITL. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Foundation

class mapKitViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var mapKit: MKMapView!
    
    var locationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (CLLocationManager.locationServicesEnabled())
        {

            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            mapKit.showsUserLocation = true
            mapKit.showsPointsOfInterest = true
            
    }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last! as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapKit.setRegion(region, animated: true)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: " + error.localizedDescription)
    }
    
    
    

}
