//
//  LocationManager.swift
//  Rain Radar
//
//  Created by Renas Ali on 10/04/2023.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject{
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?
    static let sharedLocation = LocationManager()
    
    
    
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.desiredAccuracy = kCLDistanceFilterNone
        manager.startUpdatingLocation()
        manager.requestWhenInUseAuthorization()
        
    }
    
    func requestLocation(){
        manager.requestWhenInUseAuthorization()
        
    }

}


extension LocationManager: CLLocationManagerDelegate{
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last, userLocation == nil else {return}
        
        DispatchQueue.main.async{
            self.userLocation = location
        }
   
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Can not get location", error)
    
    }
}
    
    
    
    
    
    
    
    
        
    
    


