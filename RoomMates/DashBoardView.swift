//
//  DashBoardView.swift
//  RoomMates
//
//  Created by Kacper Kita on 03/02/2020.
//  Copyright © 2020 Kacper Kita. All rights reserved.
//

import SwiftUI

struct DashBoardView: View {
    @State var isDragging = "Shop"
    @State var isNavigationBarHidden: Bool = true
    
    func showDayOfWeek() -> String {
        let date = Date()
        let dateFormatterDayInWeek = DateFormatter()
        dateFormatterDayInWeek.dateFormat = "EEEE"
        let dateFormatterDay = DateFormatter()
        dateFormatterDay.dateFormat = "dd"
        let dateFormatterMonth = DateFormatter()
        dateFormatterMonth.dateFormat = "MM"
        let dayInWeek = dateFormatterDayInWeek.string(from: date)
        let day = dateFormatterDay.string(from: date)
        let month = dateFormatterMonth.string(from: date)
        let Data = dayInWeek + " " + day + "." + month
        return Data
    }
    
    var body: some View {
        NavigationView {
        VStack {
            ZStack {
                Image("Background")
                    .offset(x: 0, y: 95)
                    .edgesIgnoringSafeArea(.all)
                    
                
                Text("Hi Username!")
                    .font(.custom("Seoge UI", size: 21))
                    .foregroundColor(Color.white)
                    .offset(x: -100, y: -100)
                
                Text(showDayOfWeek())
                    .offset(x: -100, y: 0)
                    .font(.custom("Seoge UI", size: 21))
                    .foregroundColor(Color.white)
            }
            Group {
                VStack {
                    HStack {
                        Button(action: {
                            
                        }) {
                            Image(isDragging)
                                .renderingMode(.original)
                                .gesture(LongPressGesture()
                            .onEnded { _ in
                                if self.isDragging == "Shop" {
                                    self.isDragging = "ToDo"
                                }else{
                                    self.isDragging = "Shop"
                                }
                            })
                            
                        }.offset(x: 0, y: -48)
                        
                        Button(action: {
                            
                        }) {
                            Image("ShopList")
                                .renderingMode(.original)
                        }
                    }
                    
                    HStack {
                        Button(action: {
                            
                        }) {
                            
                            Image("Home")
                                .renderingMode(.original)
                                
                        }.offset(x: 0, y: -100)
                        
                        
                        Button(action: {
                            
                        }) {
                            Image("Budget")
                                .renderingMode(.original)
                        }.offset(x: 0, y: -53)
                    }
                    
                    Button(action: {
                        
                    }) {
                        Image("Account")
                            .renderingMode(.original)
                    }.offset(x: 0, y: -105)
                    
                }
            }.offset(x: 0, y: -50)
        }
        }.navigationBarTitle("Hidden Title")
        .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear {
            self.isNavigationBarHidden = true
        }
    }
}

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView()
    }
}
