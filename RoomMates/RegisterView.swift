//
//  RegisterView.swift
//  RoomMates
//
//  Created by Kacper Kita on 27/01/2020.
//  Copyright © 2020 Kacper Kita. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var session: SessionStore
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @State var isNavigationBarHidden: Bool = true
    
    func signUp() {
        session.signUp(email: email, password: password) { (result, error) in
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
                    TextField("Login", text: $email)
                        .padding()
     
                }.frame(width: 300)
                .offset(x: 0, y: -150)
                
                ZStack {
                    Image("login")
                    SecureField("Password", text: $password)
                        .padding()
                
                    
                }.frame(width: 300)
                .offset(x: 0, y: -150)
                
               
                
            }
            //Navigation Link to register
            Button(action: signUp){
                ZStack {
                    Image("button_back")
                        .renderingMode(.original)
                    
                    Text("Register")
                        .padding(.bottom, 5.0)
                        .font(.custom("Seoge UI", size: 15))
                        .foregroundColor(Color.white)
                        
                    
                }
            }.offset(x: 0, y: -100)
            
            if (error != "") {
                Text(error)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.red)
                    .padding()
                    .offset(x: 0, y: -130)
            }
            
            HStack {
                Text("Already have an account?")
                    .font(.custom("Seoge UI", size: 11))
                    .foregroundColor(Color(red: 166/255, green: 166/255, blue: 166/255))
                //Navigation Link to create accout
                NavigationLink(destination: LoginView()) {
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
        RegisterView().environmentObject(SessionStore())
    }
}

