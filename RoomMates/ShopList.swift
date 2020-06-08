//
//  ShopList.swift
//  RoomMates
//
//  Created by Kacper Kita on 03/03/2020.
//  Copyright © 2020 Kacper Kita. All rights reserved.
//

import SwiftUI

struct ShopList: View {
    
    init() {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    @ObservedObject private var datas = firebaseDataShop
    @State private var showingAlert = false
    @State private var updateRowID = ""
    @State private var item = ""
    @State private var updateRowValue = ""
    @State private var isUpdate = false
    @State private var listItems: [String] = []
    @State private var image = "rowShop"
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
                    Image("shopIcon")
                        .offset(x: -10)
                    
                    Text("SHOP LIST")
                        .font(.system(size: 28))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 77/255, green: 47/255, blue: 148/255))
                        .padding(.trailing, 45.0)
                }
            }.offset(x: 0, y: -180)
            Spacer()
            
            ZStack {
                Image("addShop")
                
                HStack {
                    TextField("", text: $item) {
                        UIApplication.shared.endEditing()
                    }.frame(width: 230.0, height: 40.0)
                    .font(Font.system(size: 30, design: .default))
                    
                    Button(action: {
                  self.doItButtonShop()
                    }) {
                        Image("addShopBtn")
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
                            Image("rowShop")
                            .renderingMode(.original)
                            
                            Text(data.msg)
                        }.frame(height: 65)
                    }.offset(x: -21)
                }.onDelete { (indexSet) in
                    self.listItems.remove(atOffsets: indexSet)
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
    
    func doItButtonShop() {
        if self.item == "" {
            self.showingAlert = true
        }else{
            self.isUpdate ? firebaseDataShop.updateDataShop(id: self.updateRowID, txt: self.item) : firebaseDataShop.createDataShop(msg1: self.item)
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
struct ShopList_Previews: PreviewProvider {
    static var previews: some View {
        ShopList()
    }
}
