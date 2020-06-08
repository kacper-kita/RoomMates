//
//  DashBoard.swift
//  RoomMates
//
//  Created by Kacper Kita on 20/02/2020.
//  Copyright © 2020 Kacper Kita. All rights reserved.
//

import SwiftUI

struct DashBoard: View {
    
    @State var isHidden = true
    @State var isNavigationBarHidden: Bool = true
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        NavigationView {
        VStack {
            Image("BackgroundImg")
                .padding(.top, 200.0)
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                
            }) {
                Image(systemName: "line.horizontal.3")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 23, height: 20)
                    .offset(x: -149, y: -300)
                
            }
            Text("Hi Kacper !")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
                .offset(x: -90, y: -260)
            Spacer()
            
            
            HStack {
                ZStack {
                    Image("money")
                    Text("Month budget:")
                        .font(.custom("Seoge UI", size: 16))
                        .foregroundColor(Color.white)
                        .offset(x: 0, y: -30)
                    
                    Text("20$")
                        .font(.custom("Seoge UI", size: 28))
                        .foregroundColor(Color.white)
                        .offset(x: 0, y: 10)
                }
                
                ZStack {
                    Image("day")
                    
                    Text(showDayOfWeek())
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .shadow(color: .gray, radius: 0, x: 0, y: 2)
                        .foregroundColor(Color(red: 77/255, green: 47/255, blue: 148/255))
                }
            }.offset(x: 0, y: -220)
            Spacer()
            
            Group {
                VStack(alignment: .leading) {
                    Text("List")
                        .fontWeight(.medium)
                        .font(.system(size: 16))
                    
                    Image("listLine")
                    
                }
                .padding(.bottom, 15.0)
                
                VStack {
                    NavigationLink(destination: ToDoList()) {
                        Image("TO-DO")
                            .renderingMode(.original)
                    }
                    
                    NavigationLink(destination: Text("comming soon")) {
                        Image("Budget-1")
                            .renderingMode(.original)
                    }
                    
                    NavigationLink(destination: ShopList()) {
                        Image("SHOP-LIST")
                            .renderingMode(.original)
                    }
                }
            }.offset(x: 0, y: -200)
            
            Image("BackDown")
                .edgesIgnoringSafeArea(.all)
                .offset(x: 0, y: -100)
                
        }
        }.navigationBarTitle("Hidden Title")
        .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear {
            self.isNavigationBarHidden = true
        }
        
        
        
    }
}

struct DashBoard_Previews: PreviewProvider {
    static var previews: some View {
        DashBoard().environmentObject(SessionStore())
    }
}

public func showDayOfWeek() -> String {
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

