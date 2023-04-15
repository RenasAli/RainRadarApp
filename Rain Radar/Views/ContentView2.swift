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
    @State var weather: Weather?
    

    var hourlyWeatherData: [HourWeather] {
        if let weather {
            return Array(weather.hourlyForecast.filter { hourlyWeather in
                return hourlyWeather.date.timeIntervalSince(Date()) >= 0
            }.prefix(24))
        } else {
            return []
        }
    }
    var dailyWeatherData: [DayWeather] {
        if let weather {
            return Array(weather.dailyForecast.filter { dailyWeather in
                return dailyWeather.date.timeIntervalSince(Date()) >= 0
            }.prefix(6))
        } else {
            return []
        }
    }
    var body: some View {
        VStack{
            if let weather {
                VStack {
                    Text(locationManager.city)
                        .font(.largeTitle)
                    Text("\(weather.currentWeather.temperature.formatted())")
                }}
            ScrollView(.vertical){
                HourlyWeatherView(hourlyWeather: hourlyWeatherData)
                
                DailyWheatherView(dailyWeather: dailyWeatherData)
                
                Text("Radar & Map").font(.caption)
                Image("RImage").resizable().frame(maxWidth: .infinity, maxHeight: 220)
            }
            
             
            }.task(id: locationManager.currentLocation) {
                do{
                    if let location = locationManager.currentLocation{
                        
                        weather = try await weatherService.weather(for: location)
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
