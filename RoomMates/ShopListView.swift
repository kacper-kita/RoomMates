//
//  ShopListView.swift
//  RoomMates
//
//  Created by Kacper Kita on 13/02/2020.
//  Copyright © 2020 Kacper Kita. All rights reserved.
//

import SwiftUI

struct ShopListView: View {
    
    @State public var items = 0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack() {
                Image("BackG")
                    .offset(x: 0, y: 140)
                    .edgesIgnoringSafeArea(.all)
                    
                Spacer()
                ZStack {
                    VStack {
                        ScrollView {
                            if items == 0 {
                        VStack {
                            HStack {
                                Text("EMPTY")
                                    .font(.largeTitle)
                                    .frame(width: 400.0)
                            }
                            
                        }
                        
                        }else if items == 1 {
                                VStack {
                                    HStack {
                                        NavigationLink(destination: ListView()) {
                                            ZStack {
                                                Image("Back4")
                                                    .renderingMode(.original)
                                                
                                                Text("List")
                                                    .font(.title)
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    }
                                }
                            }else if items == 2{
                                VStack {
                                       HStack {
                                           NavigationLink(destination: ListView()) {
                                               ZStack {
                                                   Image("Back4")
                                                       .renderingMode(.original)
                                                   
                                                   Text("List")
                                                       .font(.title)
                                                       .foregroundColor(.black)
                                               }
                                           }
                                           
                                            NavigationLink(destination: ListView()) {
                                                ZStack {
                                                    Image("Back4")
                                                        .renderingMode(.original)
                                                    
                                                    Text("List")
                                                        .font(.title)
                                                        .foregroundColor(.black)
                                                }
                                            }
                                       }
                                   }
                            }else if items == 3{
                                VStack {
                                    HStack {
                                        NavigationLink(destination: ListView()) {
                                            ZStack {
                                                Image("Back4")
                                                    .renderingMode(.original)
                                                
                                                Text("List")
                                                    .font(.title)
                                                    .foregroundColor(.black)
                                            }
                                        }
                                        
                                         NavigationLink(destination: ListView()) {
                                             ZStack {
                                                 Image("Back4")
                                                     .renderingMode(.original)
                                                 
                                                 Text("List")
                                                     .font(.title)
                                                     .foregroundColor(.black)
                                             }
                                         }
                                    }
                                    HStack {
                                        NavigationLink(destination: ListView()) {
                                            ZStack {
                                                Image("Back4")
                                                    .renderingMode(.original)
                                                
                                                Text("List")
                                                    .font(.title)
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    }
                                }
                            }else{
                                
                                if odd(number: self.items) {
                                    ForEach(0 ..< sub(number: items) ) { item in
                                        HStack {
                                            ForEach(0 ..< 2) { _ in
                                                NavigationLink(destination: ListView()) {
                                                    ZStack {
                                                        Image("Back4")
                                                            .renderingMode(.original)
                                                        
                                                        Text("List")
                                                            .font(.title)
                                                            .foregroundColor(.black)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }else{
                                    ForEach(0 ..< sub(number: items)) { item in
                                        HStack {
                                            ForEach(0 ..< 2) { _ in
                                                NavigationLink(destination: ListView()) {
                                                    ZStack {
                                                        Image("Back4")
                                                            .renderingMode(.original)
                                                        
                                                        Text("List")
                                                            .font(.title)
                                                            .foregroundColor(.black)
                                                    }
                                                }
                                            }
                                        }
                                        
                                    }
                                    HStack {
                                    NavigationLink(destination: DashBoardView()) {
                                        ZStack {
                                            Image("Back4")
                                                .renderingMode(.original)
                                            
                                            Text("Test 1")
                                                .font(.title)
                                                .foregroundColor(.black)
                                        }
                                    }
                                    }
                                }
                            }
                             
                             
                            
                         
                        }.offset(x: 0, y: -140)
                        .frame(height: 600.0)
                    
                    }
                    
                     Button(action: {
                        self.items = self.items + 1
                     }) {
                         ZStack {
                             Image("buttonAdd")
                                .renderingMode(.original)
                            
                            Text("Add list")
                                .font(.custom("Seoge UI", size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                         }
                     }.offset(x: 0, y: 120)
                }
                
            }.navigationBarItems(leading:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrow.left.circle")
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                        Text("Go Back")
                            .foregroundColor(.white)
                            
                    }
            })
        }
        
}

struct ShopListView_Previews: PreviewProvider {
    static var previews: some View {
        ShopListView()
    }
}
}

func sub(number: Int) -> Int {
    if number == 1 || number == 2 || number == 3 {
        return number
    }else {
        return number / 2
    }
    
}

func odd(number: Int) -> Bool {
    
    return number % 2 == 0
}

