//
//  ContentView.swift
//  Rain Radar
//
//  Created by Renas Ali on 10/04/2023.
//

import SwiftUI
import CoreLocation


struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
   @State private var weather: WeatherManager.CurrentWeatherRespons?
    @StateObject var weatherManager = WeatherManager()
    
    var body: some View {
        VStack{
           
                let location = locationManager.userLocation
            Text("Hello")
                .task(
                    weather = try weatherManager.getCurrentWheather(latitude: location?.coordinate.latitude, longitude: location?.coordinate.longitude))
            if let weather = weatherManager.currentWeather{
                Text("\(weather.name)")
            }
            
            
            
        }
    }
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
