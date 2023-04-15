//
//  HourlyWeatherManager.swift
//  Rain Radar
//
//  Created by Renas Ali on 12/04/2023.
//
/*import CoreLocation
import Foundation

class HourlyWeatherManager {
    
    func getHourluWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> HourlyForecastResponse {
        let latitude = 51.4416
        let longitude = 5.4697
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=00f5ac8da07f94b789e8f1fa74a51ad2&units=metric") else{
            fatalError("Missing")
            
            
        }
        
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decodedData = try JSONDecoder().decode(HourlyForecastResponse.self, from: data)
        
        return decodedData
    }
}

struct HourlyForecastResponse: Codable {
    let id: Int
    let dt: TimeInterval
    let feelsLike: Double
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case id
        case dt
        case feelsLike = "feels_like"
        case weather
    }
    
    var hour: String {
        let date = Date(timeIntervalSince1970: dt)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h a"
        return dateFormatter.string(from: date)
    }
    
    var iconName: String {
        if let weather = weather.first {
            return weather.iconName
        }
        return ""
    }
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
    
    var iconName: String {
        return icon
    }
}
*/
