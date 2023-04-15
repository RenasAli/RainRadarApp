//
//  HourlyWeatherView.swift
//  Rain Radar
//
//  Created by Renas Ali on 13/04/2023.
//

import SwiftUI
import CoreLocation
import WeatherKit

struct HourlyWeatherView: View {
   let hourlyWeather: [HourWeather]
    var body: some View {
        VStack(alignment: .leading){
            
                VStack {
                    Text("Hourly Weather")
                        .font(.caption).opacity(0.5)
                    ScrollView(.horizontal){
                        
                                HStack{
                                    
                            ForEach(hourlyWeather, id: \.date) { hourlyWeatherItem in
                                VStack(spacing:20){
                                    Text(hourlyWeatherItem.date.formatted(date: .omitted, time: .shortened))
                                    Image(systemName: "\(hourlyWeatherItem.symbolName).fill").foregroundColor(.yellow)
                                    Text(hourlyWeatherItem.temperature.formatted()).fontWeight(.medium)
                                }.padding().background {
                                    Color.blue
                                }.clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                                    .foregroundColor(.white)
                                
                            }
                        }
                    
                }
            }
        }
    }
}

