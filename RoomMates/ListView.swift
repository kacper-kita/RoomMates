//
//  ListView.swift
//  RoomMates
//
//  Created by Kacper Kita on 14/02/2020.
//  Copyright © 2020 Kacper Kita. All rights reserved.
//

import SwiftUI




struct ListView: View {
    
    init() {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    @State private var listItems: [String] = []
    @State private var item = ""
    @State public var title = ""
    @Environment(\.presentationMode) var presentationMode
    @State var isHidden = true
    @State var isNavigationBarHidden: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                Image("BackG")
                    .padding(.top, 311.0)
                    .edgesIgnoringSafeArea(.all)
                    .offset(x: 0, y: 0)
                Spacer()
                
                Group {
                    TextField("Test2", text: $title)
                        .frame(width: 200, height: nil)
                        .font(Font.system(size: 30, design: .default))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.gray)
                        
                    Divider()
                    .frame(width: 200, height: nil)
                }.offset(x: 0, y: -160)
                
                
                    ZStack {
                        Image("textBack")
                        
                        HStack {
                            TextField("", text: $item)
                                .frame(width: 240, height: 30)
                                .offset(x: 7)
                                
                            
                            Button(action: {
                                if self.item == "" {
                                    
                                }else{
                                    self.addRow()
                                }
                            }) {
                                Image("AddList")
                                    .resizable()
                                    .renderingMode(.original)
                                    .frame(width: 45, height: 45)
                            }
                        }
                        
                            
                    }.padding(.leading, 25.0)
                    .offset(x: -15, y: -150)
                
                List{
                    ForEach(listItems, id: \.self) { items in
                        ZStack {
                            Image("textBack")
                            
                            Text(items)
                        }
                        .padding(.leading, 24.0)
                        
                    }.onDelete { (indexSet) in
                        self.listItems.remove(atOffsets: indexSet)
                    }
                }
                .padding(.bottom, 80.0)
                .frame(height: 600)
                    .offset(x: 0, y: -100)
                
                
                
            }
            
        }.navigationBarTitle("Hidden Title")
        .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear {
            self.isNavigationBarHidden = true
        }
    }
    func addRow() {
        self.listItems.append(item)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}



