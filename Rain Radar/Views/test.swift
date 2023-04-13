//
//  test.swift
//  Rain Radar
//
//  Created by Renas Ali on 13/04/2023.
//

import SwiftUI

struct HourlyWeatherView: View {
    @State var hourlyWeather: [HourlyWeatherInfo] = []
    
    var body: some View {
        VStack {
            if hourlyWeather.isEmpty {
                Text("Loading hourly weather...")
            } else {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(hourlyWeather) { weatherInfo in
                            VStack {
                                Text(weatherInfo.hour)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                Image(systemName: weatherInfo.iconName)
                                    .renderingMode(.original)
                                    .font(.system(size: 36))
                                
                                Text("\(weatherInfo.feelsLikeTemp)°")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .onAppear(perform: fetchHourlyWeatherData)
    }
    
    func fetchHourlyWeatherData() {
        let apiKey = "YOUR_API_KEY_HERE"
        let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast/hourly?q=London&appid=\(apiKey)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Error fetching hourly weather data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            if let decodedResponse = try? JSONDecoder().decode(HourlyForecastResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.hourlyWeather = decodedResponse.list.map { weatherInfo in
                        return HourlyWeatherInfo(hour: weatherInfo.dt_txt, feelsLikeTemp: Int(weatherInfo.main.feels_like), iconName: weatherInfo.weather.first?.icon ?? "questionmark")
                    }
                }
            } else {
                print("Failed to decode hourly weather data")
            }
        }.resume()
    }
}

struct HourlyWeatherInfo {
    let hour: String
    let feelsLikeTemp: Int
    let iconName: String
}

struct HourlyForecastResponse: Codable {
    let list: [HourlyForecast]
}

struct HourlyForecast: Codable {
    let dt_txt: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let feels_like: Double
}

struct Weather: Codable {
    let icon: String
}
