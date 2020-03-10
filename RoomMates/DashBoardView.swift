//
//  DashBoardView.swift
//  RoomMates
//
//  Created by Kacper Kita on 03/02/2020.
//  Copyright © 2020 Kacper Kita. All rights reserved.
//

import SwiftUI

struct DashBoardView: View {
    @State var isHidden = true
    @State var isNavigationBarHidden: Bool = true
    
    
    
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
                        ZStack {
                            Button(action: {
                                
                            }) {
                                ZStack {
                                    Image("rectangleBack")
                                        .renderingMode(.original)
                                        .gesture(
                                            LongPressGesture()
                                                .onEnded({ _ in
                                                    self.isHidden.toggle()
                                                })
                                        )
                                    
                                    VStack(alignment: .center) {
                                         HStack {
                                                                                  Image("Ellips")
                                                                                  .renderingMode(.original)
                                                                                  .padding(.bottom, 10.0)
                                                                                  Text("Read book")
                                                                                  .font(.custom("Seoge UI", size: 11))
                                                                                      .foregroundColor(Color.white)
                                                                                      .multilineTextAlignment(.center)
                                                                                      .padding(.bottom, 9.0)
                                                                                      .padding(.leading, -18.0)
                                                                                      .frame(width: 80.0)
                                                                              }
                                        HStack {
                                            Image("Ellips")
                                            .renderingMode(.original)
                                            .padding(.bottom, 10.0)
                                            Text("Listen music")
                                            .font(.custom("Seoge UI", size: 11))
                                                .foregroundColor(Color.white)
                                                .multilineTextAlignment(.center)
                                                .padding(.bottom, 9.0)
                                                .padding(.leading, -18.0)
                                                .frame(width: 80.0)
                                        }
                                          HStack {
                                                                                  Image("Ellips")
                                                                                  .renderingMode(.original)
                                                                                  .padding(.bottom, 10.0)
                                                                                  Text("Read book")
                                                                                  .font(.custom("Seoge UI", size: 11))
                                                                                      .foregroundColor(Color.white)
                                                                                      .multilineTextAlignment(.center)
                                                                                      .padding(.bottom, 9.0)
                                                                                      .padding(.leading, -18.0)
                                                                                      .frame(width: 80.0)
                                                                              }
                                        
                                        
                                        
                                    }
                                    if isHidden {
                                        Image("Shop")
                                        .renderingMode(.original)
                                        .gesture(
                                                LongPressGesture()
                                                    .onEnded({ _ in
                                                        self.isHidden.toggle()
                                                    })
                                            )
                                        
                                    }
                                }.offset(x: -94)
                            }
                            .offset(x: 12, y: -44)
                            
                            NavigationLink(destination: ShopListView()) {
                                Image("ShopList")
                                .renderingMode(.original)
                            }.offset(x: 93, y: 3)
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
