//
//  TabView.swift
//  Rain Radar
//
//  Created by Renas Ali on 15/04/2023.
//

import SwiftUI

struct TabViewForm: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem(){
                    Image(systemName: "cloud").foregroundColor(.black)
                        .font(.system(size: 30))
                }
            Goal()
                .tabItem(){
                    Image(systemName: "flame").foregroundColor(.orange)
                }
            Calendar()
                .tabItem(){
                    Image(systemName: "calendar")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewForm()
    }
}
