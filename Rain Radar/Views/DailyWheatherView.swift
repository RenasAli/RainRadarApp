//
//  DailyWheatherView.swift
//  Rain Radar
//
//  Created by Renas Ali on 13/04/2023.
//

import SwiftUI
import CoreLocation
import WeatherKit

struct DailyWheatherView: View {
    let dailyWeather: [DayWeather]
    var body: some View {
        VStack(alignment: .leading) {
                    Text("Daily Weather")
                        .font(.caption)
                        .opacity(0.5)
                    
                    List(dailyWeather, id: \.date) { dailyWeather in
                        HStack {
                            Text(dailyWeather.date.formatted(date: .abbreviated, time: .omitted))
                                .frame(maxWidth: 50, alignment: .leading)
                            
                            Image(systemName: "\(dailyWeather.symbolName)")
                                .foregroundColor(.yellow)
                            
                            Text(dailyWeather.lowTemperature.formatted())
                                .frame(maxWidth: .infinity)
                            
                            Text(dailyWeather.highTemperature.formatted())
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }.listRowBackground(Color.blue)
                    }.listStyle(.plain)
                }
                .frame(height: 300).padding()
                .background(content: {
                    Color.blue
                })
                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                .foregroundColor(.white)
            }
    }



