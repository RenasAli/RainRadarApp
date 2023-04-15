//
//  LocationManager.swift
//  Rain Radar
//
//  Created by Renas Ali on 10/04/2023.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    @Published var city = ""
    @Published var currentLocation: CLLocation?
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last, currentLocation == nil else { return }
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let placemark = placemarks?.first else { return }
            
            if let city = placemark.locality {
                self.city = city
            }
            
            DispatchQueue.main.async {
                self.currentLocation = location
            }
        }
    }
    
}
