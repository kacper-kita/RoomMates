//
//  SlideMenuView.swift
//  RoomMates
//
//  Created by Kacper Kita on 19/03/2020.
//  Copyright © 2020 Kacper Kita. All rights reserved.
//

import SwiftUI

struct SlideMenuView: View {
    @EnvironmentObject var session: SessionStore
    var body: some View {
        VStack {
          Image("ROOMMATES2")
            .resizable()
            .frame(width: 100, height: 100)
            .offset(x: 0, y: 30)
            
            Spacer()
            
            Text("Kacper")
                .font(.system(.largeTitle))
                .offset(x: 0, y: -160)
            Spacer()
            
            HStack {
              Image(systemName: "person.3.fill")
                .resizable()
                .frame(width: 40, height: 30, alignment: .leading)
                .foregroundColor(.blue)
              Text("RoomMates")
                .font(.system(size: 23))
                .padding(.leading, 16.0)
            }.offset(x: -20, y: -330)
            HStack {
              Image(systemName: "house.fill")
                .resizable()
                .frame(width: 32, height: 30, alignment: .leading)
                .foregroundColor(.orange)
              Text("RoomMates")
                .font(.system(size: 23))
                .padding(.leading, 16.0)
            }.offset(x: -20, y: -290)
            HStack {
              Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 32, height: 30, alignment: .leading)
                .foregroundColor(.purple)
              Text("RoomMates")
                .font(.system(size: 23))
                .padding(.leading, 16.0)
            }.offset(x: -20, y: -250)
            
            Button(action: session.signOut) {
                Text("Log Out")
                    .foregroundColor(.black)
                    .font(.system(size: 32))
            }
        }
    }
}

struct SlideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SlideMenuView().environmentObject(SessionStore())
    }
}
