//
//  GoalFormView.swift
//  Rain Radar
//
//  Created by Jasper Broekmans on 11/04/2023.
//
import SwiftUI

struct GoalFormView: View {
    @State private var selection = 0
       
       var body: some View {
           ZStack {
               Color.gray.opacity(0.1)
                   .ignoresSafeArea()
               
               VStack {
                   Image("runillustration1")
                       .resizable()
                       .aspectRatio(contentMode: .fill)
                       .frame(height: UIScreen.main.bounds.height * 0.3)
                       .background(Color.white)
                       .padding(.vertical, -8)
                   
                   
                   
                   
                   
                   VStack(alignment: .leading){
                       TextField("Weekly run", text: .constant(""))
                           .font(.largeTitle)
                           .foregroundColor(.orange)
                           .padding(.horizontal, 30)
                           .padding(.vertical, 10)
                           .background(Color.white)
                           .cornerRadius(5.0)
                   }
                   
                   
                   
                   
                   VStack(alignment: .leading) {
                       Text("Ending date")
                           .font(.subheadline)
                           .foregroundColor(.black)
                           .padding(.horizontal, 10)
                       
                       VStack {
                           TextField("April 26, 2023", text: .constant(""))
                               .font(.subheadline)
                               .foregroundColor(.black)
                               .padding(.horizontal, 30)
                               .padding(.vertical, 15)
                               .background(Color.white)
                               .cornerRadius(5.0)
                       }
                       .padding(.horizontal, 10)
                   }
                   .frame(maxWidth: .infinity, alignment: .leading)
                   
                   VStack(alignment: .leading) {
                       Text("Goal reminder")
                           .font(.subheadline)
                           .foregroundColor(.black)
                           .padding(.horizontal, 10)
                       
                       ZStack(alignment: .leading) {
                           TextField("", text: .constant(""))
                               .font(.subheadline)
                               .foregroundColor(.black)
                               .padding(.horizontal, 30)
                               .padding(.vertical, 15)
                               .background(Color.white)
                               .cornerRadius(5.0)
                           
                           HStack {
                               Image(systemName: "alarm")
                                   .foregroundColor(.black)
                                   .font(.system(size: 12)) // adjust the font size as needed
                                   .padding(.leading, 10)
                                   .padding(.top, -5)
                               HStack {
                                   Text("8:00 a.m.")
                                       .foregroundColor(.black)
                                       .font(.footnote)
                                   Spacer()
                               }
                               .padding(.bottom, 9)
                               .padding(.top, 6)
                           }
                           .padding(.horizontal, 10)
                           
                           VStack(alignment: .leading) {
                               Text("17 April, 2023")
                                   .font(.footnote)
                                   .foregroundColor(.gray)
                                   .padding(.top, -19)
                                   .padding(.leading, 10)
                           }
                           .offset(x: 30, y: 24)
                       }
                       .padding(.horizontal, 10)
                   }
                   
                   VStack(alignment: .leading) {
                       Text("H A B I T")
                           .font(.headline)
                           .foregroundColor(.black)
                           .padding(.horizontal, 10)
                       
                       ZStack(alignment: .leading) {
                           TextField("", text: .constant(""))
                               .font(.subheadline)
                               .foregroundColor(.black)
                               .padding(.horizontal, 30)
                               .padding(.vertical, 15)
                               .background(Color.white)
                               .cornerRadius(5.0)
                           
                           HStack {
                               Text("Run 3 times a week")
                                   .foregroundColor(.black)
                                   .font(.footnote)
                                   .padding(.leading, 10)
                               
                               Spacer()
                           }
                           .padding(.horizontal, 10)
                           
                           HStack {
                               Image(systemName: "alarm")
                                   .foregroundColor(.black)
                                   .font(.system(size: 9))
                                   .padding(.top, +30)
                                   .padding(.leading, 10)
                               
                               Text("8:00 a.m.")
                                   .font(.footnote)
                                   .foregroundColor(.gray)
                                   .padding(.top, +30)
                               
                               Spacer()
                           }
                           .padding(.horizontal, 10)
                           
                           HStack {
                               Spacer()
                               
                               Text("S")
                                   .foregroundColor(.gray)
                               
                               Text(" M")
                                   .foregroundColor(.purple)
                               
                               Text(" T")
                                   .foregroundColor(.gray)
                               
                               Text(" W")
                                   .foregroundColor(.purple)
                               
                               Text(" T")
                                   .foregroundColor(.purple)
                               
                               Text(" F")
                                   .foregroundColor(.gray)
                               
                               Text(" S")
                                   .foregroundColor(.gray)
                               
                           }.font(.footnote)
                               .padding(.trailing, 10)
                       }
                       .padding(.horizontal, 10)
                   }
                   Button(action: {
                       // Action to be performed when button is tapped
                   }, label: {
                       Text("Achieve this goal")
                           .foregroundColor(.white)
                           .padding(.horizontal, 60)
                           .padding(.vertical, 15)
                           .background(Color.orange)
                           .cornerRadius(20)
                           .padding(.top, 45)
                   })
                   
                   Spacer()
                   ZStack {
                       Rectangle()
                           .foregroundColor(Color.white)
                           .ignoresSafeArea()
                           .padding(.top, 18)
                       HStack {
                           Button(action: {
                               // Action to be performed when button is tapped
                           }, label: {
                               Image(systemName: "calendar")
                                   .foregroundColor(.black)
                                   .font(.system(size: 30))
                           })
                           
                           Spacer()
                           
                           Button(action: {
                               // Action to be performed when button is tapped
                           }, label: {
                               Image(systemName: "flame")
                                   .foregroundColor(.black)
                                   .font(.system(size: 30))
                           })
                           
                           Spacer()
                           
                           Button(action: {
                               // Action to be performed when button is tapped
                           }, label: {
                               Image(systemName: "cloud")
                                   .foregroundColor(.black)
                                   .font(.system(size: 30))
                           })
                       }
                       .padding(.top, 20)
                       .padding(.horizontal, 30)
                   }
                   
                   
                   
               }
           }
           }
       }



struct GoalFormView_Previews: PreviewProvider {
    static var previews: some View {
        GoalFormView()
    }
}
