//
//  WeatherManager.swift
//  Rain Radar
//
//  Created by Renas Ali on 11/04/2023.
//

import Foundation
import CoreLocation

class WeatherManager: ObservableObject{
    
    
    @Published var currentWeather : CurrentWeatherRespons?
    
    func getCurrentWheather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\("423892ae65361ff4a94a43f6cb989e3e")&units=metric"
        )else {fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: url){
            data, response, error in
            
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(CurrentWeatherRespons.self, from: data)
                    DispatchQueue.main.async {
                        self.currentWeather = decodedResponse
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    
    // Model of the response body we get from calling the OpenWeather API
    struct CurrentWeatherRespons: Decodable {
        var coord: CoordinatesResponse
        var weather: [WeatherResponse]
        var main: MainResponse
        var name: String
        var wind: WindResponse
        
        struct CoordinatesResponse: Decodable {
            var lon: Double
            var lat: Double
        }
        
        struct WeatherResponse: Decodable {
            var id: Double
            var main: String
            var description: String
            var icon: String
        }
        
        struct MainResponse: Decodable {
            var temp: Double
            var feels_like: Double
            var temp_min: Double
            var temp_max: Double
            var pressure: Double
            var humidity: Double
        }
        
        struct WindResponse: Decodable {
            var speed: Double
            var deg: Double
        }
    }
    
}


    

