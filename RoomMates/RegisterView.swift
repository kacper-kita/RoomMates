//
//  RegisterView.swift
//  RoomMates
//
//  Created by Kacper Kita on 27/01/2020.
//  Copyright © 2020 Kacper Kita. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    
    
    @State private var login: String = ""
    @State private var password: String = ""
    @State var isNavigationBarHidden: Bool = true
    
    var body: some View {
        NavigationView {
        VStack {
            Image("Background")
                .edgesIgnoringSafeArea(.all)
                .offset(x: 0, y: -6)
            Spacer()
            Text("Welcome!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 77/255, green: 47/255, blue: 148/255))
                .offset(x: 0, y: -190)
            
            Spacer()
            
            VStack{
                ZStack {
                    Image("login")
                    TextField("Login", text: $login)
                        .padding()
     
                }.frame(width: 300)
                .offset(x: 0, y: -150)
                
                ZStack {
                    Image("login")
                    SecureField("Password", text: $password)
                        .padding()
                
                    
                }.frame(width: 300)
                .offset(x: 0, y: -150)
                
                ZStack {
                    Image("login")
                    SecureField("Repeat password", text: $login)
                        .padding()
                
                    
                }.frame(width: 300)
                .offset(x: 0, y: -150)
                
            }
            //Navigation Link to register
            NavigationLink(destination: StepOne()) {
                ZStack {
                    Image("button_back")
                        .renderingMode(.original)
                    
                    Text("Register")
                        .padding(.bottom, 5.0)
                        .font(.custom("Seoge UI", size: 15))
                        .foregroundColor(Color.white)
                        
                    
                }
                
                
            }.offset(x: 0, y: -100)
            
            HStack {
                Text("Already have an account?")
                    .font(.custom("Seoge UI", size: 11))
                    .foregroundColor(Color(red: 166/255, green: 166/255, blue: 166/255))
                //Navigation Link to create accout
                NavigationLink(destination: ContentView()) {
                    Text("Login")
                    .font(.custom("Seoge UI", size: 11))
                    .foregroundColor(Color(red: 77/255, green: 47/255, blue: 148/255))
                    
                }
            }
            }
        }.navigationBarTitle("Hidden Title")
        .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear {
            self.isNavigationBarHidden = true
        }
        
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

