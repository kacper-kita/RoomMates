//
//  StepOne.swift
//  RoomMates
//
//  Created by Kacper Kita on 27/01/2020.
//  Copyright © 2020 Kacper Kita. All rights reserved.
//

import SwiftUI

struct StepOne: View {
    
    @State private var isActive = false
    @State private var name = ""
    @State var isNavigationBarHidden: Bool = true

    var body: some View {
        NavigationView {
            VStack {
                    Image("Background")
                        .edgesIgnoringSafeArea(.all)
                        .offset(x: 0, y: -6)
                    Spacer()
                    Text("Step 1:")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 77/255, green: 47/255, blue: 148/255))
                        .offset(x: 0, y: -190)
                    
                    Spacer()
                    
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Name:")
                                .font(.custom("Seoge UI", size: 19))
                                .foregroundColor(Color(red: 102/255, green: 102/255, blue: 102/255))
                                .padding(.leading, 12.0)
                            ZStack {
                                Image("login")
                                TextField("", text: $name)
                                    .padding()
                            
                                
                            }.frame(width: 300)
                        }.offset(x: 0, y: -200)
                        
                        VStack(alignment: .leading) {
                            Text("Join to room:")
                                .font(.custom("Seoge UI", size: 19))
                                .foregroundColor(Color(red: 102/255, green: 102/255, blue: 102/255))
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 21.0)
                                .padding(.leading, 10.0)
                            HStack(spacing: -3.0) {
                                    //Navigation Create
                                    
                                NavigationLink(destination: CreateRoom()) {
                                    ZStack {
                                        Image("Button_room")
                                            .renderingMode(.original)
                                        Text("CREATE")
                                        .font(.custom("Seoge UI", size: 19))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color(red: 77/255, green: 47/255, blue: 148/255))
                                            .padding(.bottom, 12.0)
                                    }
                                }
                                //Navigation Join
                                NavigationLink(destination: JoinToRoom()) {
                                    ZStack {
                                        Image("Button_room")
                                            .renderingMode(.original)
                                        
                                        Text("JOIN")
                                        .font(.custom("Seoge UI", size: 19))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color(red: 77/255, green: 47/255, blue: 148/255))
                                            .padding(.bottom, 12.0)
                                    }
                                }
                            }
                        }.offset(x: 0, y: -180)
                    }
                }
            }.navigationBarTitle("Hidden Title")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
        }
}

struct StepOne_Previews: PreviewProvider {
    static var previews: some View {
        StepOne()
    }
}
