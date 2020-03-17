//
//  ToDoList.swift
//  RoomMates
//
//  Created by Kacper Kita on 20/02/2020.
//  Copyright © 2020 Kacper Kita. All rights reserved.
//

import SwiftUI

struct ToDoList: View {
    
    @ObservedObject private var datas = firebaseData
    
    init() {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    @State private var showingAlert = false
    @State private var updateRowID = ""
    @State private var item = ""
    @State private var updateRowValue = ""
    @State private var isUpdate = false
    @State private var listItems: [String] = []
    @State private var image = "list"
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
        VStack {
            Image("BackgroundImg")
                .padding(.top, 146.0)
                .edgesIgnoringSafeArea(.all)
                
            Spacer()
            
            ZStack {
                Image("Main")
                
                HStack {
                    Image("icon")
                        .offset(x: -10)
                    
                    Text("TO-DO-LIST")
                        .font(.system(size: 28))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 77/255, green: 47/255, blue: 148/255))
                        .padding(.trailing, 45.0)
                }
            }.offset(x: 0, y: -180)
            Spacer()
            
            ZStack {
                Image("Input")
                
                HStack {
                    TextField("", text: $item) {
                        UIApplication.shared.endEditing()
                    }.frame(width: 230.0, height: 40.0)
                    .font(Font.system(size: 30, design: .default))
                    
                    Button(action: {
                        self.doItButton()
                    }) {
                        Image("addBtn")
                            .renderingMode(.original)
                        
                    }.alert(isPresented:$showingAlert) {
                        Alert(title: Text("Please complete this filed"), message: Text(""), dismissButton: .default(Text("Got it!")))
                    }
                    
                }
            }.offset(x: 0, y: -180)
            
            VStack(alignment: .leading) {
                Text("List")
                    .fontWeight(.medium)
                    .font(.system(size: 16))
                
                Image("listLine")
                
            }.offset(x: 0, y: -180)
            
            List{
                ForEach(datas.data) { data in
                    Button(action: {
                        self.isUpdate = true
                        self.updateRowID = data.id
                        self.updateRowValue = data.msg
                    }) {
                        ZStack {
                            Image("list")
                            .renderingMode(.original)
                                
                            
                            Text(data.msg)
                        }.frame(height: 65)
                    }.offset(x: -21)
                }.onDelete { (index) in
                    firebaseData.deleteData(datas: self.datas, index: index)
                }
            }
            .frame(width: 325.0, height: 400.0)
                .offset(x: 0, y: -180)
            Spacer()
            
            
        }
        }.edgesIgnoringSafeArea(.bottom)
        // Hide the system back button
        .navigationBarBackButtonHidden(true)
        // Add your custom back button here
        .navigationBarItems(leading:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "arrow.left")
                        .foregroundColor(Color.white)
                    
                }
        })
    }
    func addRow() {
        self.listItems.append(item)
    }
    
    func doItButton() {
        if self.item == "" {
            self.showingAlert = true
        }else{
            self.isUpdate ? firebaseData.updateData(id: self.updateRowID, txt: self.item) : firebaseData.createData(msg1: self.item)
            self.isUpdate = false
            self.item = ""
        }
    }
    //MARK: Do dokończenia
    /*
    func changeImage() -> some View {
        return AnyView(ZStack {
            Image(self.image)
                .renderingMode(.original)
            
        })    
    }
 */
}

struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList()
    }
}


