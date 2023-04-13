//
//  RainRadarManager.swift
//  Rain Radar
//
//  Created by Renas Ali on 13/04/2023.
//

import Foundation

class RainRadarManager{
    func getRainRadar() async throws -> BuienradarResponse{
        guard let url = URL(string: "https://data.buienradar.nl/2.0/feed/json")else {
            fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decodedData = try JSONDecoder().decode(BuienradarResponse.self, from: data)
        
        return decodedData
    }
}
struct BuienradarResponse: Codable {
    let actual: Actual
    let forecast: [Forecast]
}

struct Actual: Codable {
    let stationmeasurements: [StationMeasurement]
}

struct StationMeasurement: Codable {
    let stationid: String
    let stationname: String
    let lat: Double
    let lon: Double
    let regio: String
    let timestamp: String
    let condition: String
    let conditioncode: Int
    let symbol: String
    let temperature: Double
    let feeltemperature: Double
    let humidity: Int
    let windspeed: Double
    let winddirection: Int
    let pressure: Double
    let visibility: Int
    let gusts: Double?
    let precipitation: Double
}

struct Forecast: Codable {
    let stationid: String
    let stationname: String
    let lat: Double
    let lon: Double
    let regio: String
    let timestamp: String
    let condition: String
    let conditioncode: Int
    let symbol: String
    let temperature: Double
    let feeltemperature: Double
    let humidity: Int
    let windspeed: Double
    let winddirection: Int
    let pressure: Double
    let visibility: Int
    let gusts: Double?
    let precipitation: Double
    let sunrise: String
    let sunset: String
}
