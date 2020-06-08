//
//  FirebaseDataShop.swift
//  RoomMates
//
//  Created by Kacper Kita on 18/03/2020.
//  Copyright © 2020 Kacper Kita. All rights reserved.
//

import Firebase
import FirebaseFirestore

let dbCollectionShop = Firestore.firestore().collection("dbShopList")
let firebaseDataShop = FirebaseDataShop()

class FirebaseDataShop: ObservableObject {
    @Published var data = [ThreadDataType]()
    
    init() {
        readDataShop()
    }
    
    func createDataShop(msg1: String) {
        dbCollectionShop.document().setData(["id" :
            dbCollectionShop.document().documentID, "Text":msg1]) { (err) in
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }else{
                    print("Create data Success")
                }
        }
    }
    
    func readDataShop() {
        dbCollectionShop.addSnapshotListener { (documentSnapshot, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else{
                print("Read data Success")
            }
            
            documentSnapshot!.documentChanges.forEach { diff in
                if (diff.type == .added) {
                    let msgData = ThreadDataType(id: diff.document.documentID, msg: diff.document.get("Text") as! String)
                    self.data.append(msgData)
                }
                
                if (diff.type == .modified) {
                    self.data = self.data.map { (eachData) -> ThreadDataType in
                        var data = eachData
                        if data.id == diff.document.documentID {
                            data.msg = diff.document.get("Text") as! String
                            return data
                        }else{
                            return eachData
                        }
                    }
                }
            }
        }
    }
    
    func deleteDataShop(datas: FirebaseDataShop, index: IndexSet) {
        let id = datas.data[index.first!].id
        dbCollectionShop.document(id).delete { (err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else{
                print("Delete data Success")
            }
            datas.data.remove(atOffsets: index)
        }
    }
    
    func updateDataShop(id: String, txt: String) {
        dbCollectionShop.document(id).updateData(["Text":txt]) { (err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else{
                print("Update data Success")
            }
        }
    }
}
