//
//  ContentView.swift
//  RoomMates
//
//  Created by Kacper Kita on 26/01/2020.
//  Copyright © 2020 Kacper Kita. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var session: SessionStore
    @State private var showModal: Bool = false
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @State private var isActive = false
    @State var isNavigationBarHidden: Bool = true
    
    
    func signIn() {
        session.signIn(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            }else{
                self.email = ""
                self.password = ""
            }
        }
    }
    
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
                    TextField("Login", text: $email) {
                        UIApplication.shared.endEditing()
                    }
                        .padding()
     
                }.frame(width: 300)
                .offset(x: 0, y: -200)
                ZStack {
                    Image("login")
                    SecureField("Password", text: $password) {
                        UIApplication.shared.endEditing()
                    }
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
            Button(action: signIn) {
                ZStack {
                    Image("button_back")
                        .renderingMode(.original)
                    Text("LOGIN")
                        .padding(.bottom, 5.0)
                        .font(.custom("Seoge UI", size: 15))
                        .foregroundColor(Color.white)
                        
                }
            }.offset(x: 0, y: -150)
            
            if (error != "") {
                Text(error)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.red)
                    .padding()
                    .offset(x: 0, y: -130)
            }
            
            HStack {
                Text("Don't have any account?")
                    .font(.custom("Seoge UI", size: 11))
                    .foregroundColor(Color(red: 166/255, green: 166/255, blue: 166/255))
                //Navigation Link to create accout
                
                NavigationLink(destination: RegisterView()) {
                    Text("Create your account")
                    .font(.custom("Seoge UI", size: 11))
                    .foregroundColor(Color(red: 77/255, green: 47/255, blue: 148/255))
                }
                
            }
        }
        }
        .navigationBarTitle("Hidden Title")
        .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear(){
            self.isNavigationBarHidden = true
        }
    
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(SessionStore())
    }
}

public extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
