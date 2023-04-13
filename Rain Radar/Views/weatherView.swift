//
//  weatherView.swift
//  Rain Radar
//
//  Created by Renas Ali on 12/04/2023.
//

/*import SwiftUI

struct weatherView: View {
    var weather: ResponseBody
   
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack{
                Text(weather.name)
                    .bold()
                    .font(.title)
                    .padding(.leading, 15.0)
            }
            HStack{
                Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                    .fontWeight(.light)
            }}
        .frame(maxWidth: .infinity, alignment: .leading)
        
        Spacer()
        VStack {
            HStack {
                VStack(spacing: 20) {
                    Image(systemName: "cloud")
                        .font(.system(size: 40))
                    
                    Text("\(weather.weather[0].main)")
                }
                .frame(width: 150, alignment: .leading)
                
                Spacer()
                
                Text(weather.main.feelsLike.roundDouble() + "°")
                    .font(.system(size: 100))
                    .fontWeight(.bold)
                    .padding()
            }
            
            Spacer()
        }
    }
    
}
    
    struct weatherView_Previews: PreviewProvider {
        static var previews: some View {
            weatherView(weather: previewWeather )
        }
    }
*/

