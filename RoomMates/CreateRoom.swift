//
//  CreateRoom.swift
//  RoomMates
//
//  Created by Kacper Kita on 27/01/2020.
//  Copyright © 2020 Kacper Kita. All rights reserved.
//

import SwiftUI

struct CreateRoom: View {
    
    @State private var name = ""
    
       var body: some View {
        VStack {
        Image("Background")
            .edgesIgnoringSafeArea(.all)
            .offset(x: 0, y: -6)
        Spacer()
            VStack {
                Text("Step 2:")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 77/255, green: 47/255, blue: 148/255))
                .offset(x: 0, y: -160)
                
                Text("Create Room")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 77/255, green: 47/255, blue: 148/255))
                .offset(x: 0, y: -160)
            }
        
        
        Spacer()
        
        VStack {
            VStack(alignment: .leading) {
                Text("Room Name:")
                    .font(.custom("Seoge UI", size: 19))
                    .foregroundColor(Color(red: 102/255, green: 102/255, blue: 102/255))
                    .padding(.leading, 12.0)
                ZStack {
                    Image("login")
                    TextField("", text: $name)
                        .padding()
                
                    
                }.frame(width: 300)
            }.offset(x: 0, y: -130)
            
            VStack(alignment: .leading) {
                Text("Add roommates: (emails)")
                    .font(.custom("Seoge UI", size: 19))
                    .foregroundColor(Color(red: 102/255, green: 102/255, blue: 102/255))
                    .padding(.leading, 12.0)
                ZStack {
                    Image("login")
                    TextField("", text: $name)
                        .padding()
                
                    
                }.frame(width: 300)
                
                ZStack {
                    Image("login")
                    TextField("", text: $name)
                        .padding()
                
                    
                }.frame(width: 300)
            }.offset(x: 0, y: -120)
            
            Button(action: {
                
            }) {
                ZStack {
                    Image("button_back")
                        .renderingMode(.original)
                    Text("FINISH")
                        .font(.custom("Seoge UI", size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 7.0)
                }
            }.offset(x: 0, y: -70)
        }
        }
    }
}

struct CreateRoom_Previews: PreviewProvider {
    static var previews: some View {
        CreateRoom()
    }
}
