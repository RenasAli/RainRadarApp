//
//  ContentView.swift
//  Rain Radar
//
//  Created by Renas Ali on 10/04/2023.
//

/*import SwiftUI
import CoreLocation


struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    @State private var weather: ResponseBody?
    @State private var hourlyweather: HourlyForecastResponse?
    var weatherManager = WeatherManager()
    var hourlyWeatherManager = HourlyWeatherManager()
    
    var body: some View {
        
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    weatherView(weather: weather )
                    HourlyWeatherView()
                } else {
                    LoadingView()
                        .task() {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                
                                hourlyweather = try await
                                hourlyWeatherManager.getHourluWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting CurrentWeather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        
    }}
    
*/
    
   

