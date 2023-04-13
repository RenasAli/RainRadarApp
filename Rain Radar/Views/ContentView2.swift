//
//  ContentView2.swift
//  Rain Radar
//
//  Created by Renas Ali on 13/04/2023.
//

import SwiftUI
import CoreLocation
import WeatherKit


struct ContentView: View {
    let weatherService = WeatherService.shared
    @StateObject private var locationManager = LocationManager()
    var weather: Weather?
    var hourlyWeatherData: [HourWeather] {
            if let weather {
                return Array(weather.hourlyForecast.filter { hourlyWeather in
                    return hourlyWeather.date.timeIntervalSince(Date()) >= 0
                }.prefix(24))
            } else {
                return []
            }
        }
    var body: some View {
        VStack{
            if let weather {
                VStack {
                    Text("San Francisco")
                        .font(.largeTitle)
                    Text("\(weather.currentWeather.temperature.formatted())")
                }}
            HourlyWeatherView(hourlyWeather: hourlyWeatherData)
            
            DailyWheatherView(dailyWeather: weather.dailyForecast.forecast)
            
        }.task(id: locationManager.currentLocation) {
            do{
                if let location = locationManager.currentLocation{
                    self.weather = try await weatherService.weather(for: location)
                    print(weather)
                }
            }catch{
                print(error)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
