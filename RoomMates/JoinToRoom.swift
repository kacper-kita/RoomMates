//
//  JoinToRoom.swift
//  RoomMates
//
//  Created by Kacper Kita on 27/01/2020.
//  Copyright © 2020 Kacper Kita. All rights reserved.
//

import SwiftUI

struct JoinToRoom: View {
    
    @State private var roomID = ""
    @Environment(\.presentationMode) var presentationMode
    @State var isHidden = true
    @State var isNavigationBarHidden: Bool = true
    
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
                .offset(x: 0, y: -200)
                
                Text("Join To Room")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 77/255, green: 47/255, blue: 148/255))
                .offset(x: 0, y: -200)
            }
        
        
        Spacer()
        
        VStack {
            VStack(alignment: .leading) {
                Text("Room ID:")
                    .font(.custom("Seoge UI", size: 19))
                    .foregroundColor(Color(red: 102/255, green: 102/255, blue: 102/255))
                    .padding(.leading, 12.0)
                ZStack {
                    Image("login")
                    TextField("", text: $roomID)
                        .padding()
                
                    
                }.frame(width: 300)
            }.offset(x: 0, y: -230)
            Button(action: {
                self.presentationMode.wrappedValue.self
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
        
            }.offset(x: 0, y: -170)
            
            }
        }.navigationBarTitle("Hidden Title")
        .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear {
            self.isNavigationBarHidden = true
        }
    }
}

struct JoinToRoom_Previews: PreviewProvider {
    static var previews: some View {
        JoinToRoom()
    }
}
