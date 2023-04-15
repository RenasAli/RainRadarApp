
//
//  Goal.swift
//  Rain Radar
//
//  Created by Jasper Broekmans on 12/04/2023.
//

import SwiftUI

struct Goal: View {
    @State private var selection = 0
    @State private var isPresented = false
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("Goals")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
                
                ZStack(alignment: .leading) {
                    TextField("", text: .constant(""))
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 55)
                        .background(Color.white)
                        .cornerRadius(5.0)
                    
                    HStack {
                        Image(systemName: "flame")
                            .foregroundColor(.black)
                            .font(.system(size: 17))
                            .padding(.leading, 10)
                            .padding(.top, -40)
                        
                        // Add the image view with the new image asset
                        Image("rsz60")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .padding(.trailing, 0)
                            .cornerRadius(10.0)
                            .offset(x: 250, y: 0)
                        
                        HStack {
                            Text("Run weekly")
                                .foregroundColor(.black)
                                .font(.subheadline)
                                .bold()
                                .padding(.top, -37)
                                .padding(.leading, -70)
                            Spacer()
                        }
                        .padding(.bottom, 9)
                        .padding(.top, 6)
                    }
                    .padding(.horizontal, 10)
                    
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                            .font(.system(size: 12))
                            .padding(.top, -35)
                            .padding(.leading, -10)
                        VStack(alignment: .leading) {
                            Text("40 days left")
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .padding(.top, -36)
                        }
                    }
                    .offset(x: 30, y: 24)
                }
                .padding(.horizontal, 10)
                
                Spacer()
               
                    Button(action: {
                        self.isPresented = true

                    }, label: {
                        Text("+ Add new")
                            .foregroundColor(.white)
                            .padding(.horizontal, 60)
                            .padding(.vertical, 15)
                            .background(Color.orange)
                            .cornerRadius(20)
                            .frame(maxWidth: .infinity)
                            .padding(.top, 435)
                             
                    }).sheet(isPresented: $isPresented) {
                        GoalFormView()}
                Spacer()
                
            }
        }
    }
}


struct Goal_Previews: PreviewProvider {
    static var previews: some View {
        Goal()
    }
}
