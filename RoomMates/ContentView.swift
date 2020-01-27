//
//  ContentView.swift
//  RoomMates
//
//  Created by Kacper Kita on 26/01/2020.
//  Copyright © 2020 Kacper Kita. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var login: String = ""
    @State private var password: String = ""
    @State private var isActive = false
    
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
                .offset(x: 0, y: -200)
                ZStack {
                    Image("login")
                    SecureField("Password", text: $password)
                        .padding()
                
                    
                }.frame(width: 300)
                .offset(x: 0, y: -200)
                
                Button(action: {
                    
                }) {
                    Text("Forgot password?")
                    .font(.custom("Seoge UI", size: 11))
                    .foregroundColor(Color(red: 166/255, green: 166/255, blue: 166/255))
                    
                }.offset(x: 80, y: -200)
                
            }
            Button(action: {
                
            }) {
                ZStack {
                    Image("button_back")
                        .renderingMode(.original)
                    Text("LOGIN")
                        .padding(.bottom, 5.0)
                        .font(.custom("Seoge UI", size: 15))
                        .foregroundColor(Color.white)
                        
                }
                
            }.offset(x: 0, y: -150)
            
            HStack {
                Text("Don't have any account?")
                    .font(.custom("Seoge UI", size: 11))
                    .foregroundColor(Color(red: 166/255, green: 166/255, blue: 166/255))
                //Navigation Link to create accout
                NavigationLink(destination: RegisterView(), isActive: self.$isActive) {
                    Text("")
                }
                
                
                Button(action: {
                    self.isActive = true
                    
               self.mode.wrappedValue.dismiss()
                }) {
                    Text("Create your account")
                    .font(.custom("Seoge UI", size: 11))
                    .foregroundColor(Color(red: 77/255, green: 47/255, blue: 148/255))
                }
            }
        
            }
            }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
