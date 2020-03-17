//
//  FirebaseData.swift
//  RoomMates
//
//  Created by Kacper Kita on 17/03/2020.
//  Copyright © 2020 Kacper Kita. All rights reserved.
//
import Firebase
import FirebaseFirestore

let dbCollection = Firestore.firestore().collection("dbToDoList")
let firebaseData = FirebaseData()

class FirebaseData: ObservableObject {
    @Published var data = [ThreadDataType]()
    
    init() {
        readData()
    }
    
    func createData(msg1: String) {
        dbCollection.document().setData(["id" :
            dbCollection.document().documentID, "Text":msg1]) { (err) in
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }else{
                    print("Create data Success")
                }
        }
    }
    
    func readData() {
        dbCollection.addSnapshotListener { (documentSnapshot, err) in
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
    
    func deleteData(datas: FirebaseData, index: IndexSet) {
        let id = datas.data[index.first!].id
        dbCollection.document(id).delete { (err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else{
                print("Delete data Success")
            }
            datas.data.remove(atOffsets: index)
        }
    }
    
    func updateData(id: String, txt: String) {
        dbCollection.document(id).updateData(["Text":txt]) { (err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else{
                print("Update data Success")
            }
        }
    }
}
