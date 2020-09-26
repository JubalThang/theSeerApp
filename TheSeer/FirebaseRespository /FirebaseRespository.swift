//
//  FirebaseAPI.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class FirebaseRespository : ObservableObject {
    let db = Firestore.firestore()
    @Published var pastors = [Pastor]()
    
    func fetchFirebase() {
       
        db.collection("pastors")
            .addSnapshotListener { (snapShot, error) in
                if let error = error {
                    print("Error fetching collection\(error.localizedDescription)")
                    return
                }
                if let snap = snapShot {
                    snap.documents.forEach { document in
//                        print("\(document.data())")
                        do {
                            guard let pastor = try document.data(as: Pastor.self) else {return}
                            self.pastors.append(pastor)
                        } catch {
                            print("Error parsing pastor : \(error.localizedDescription)")
                        }
                    }
                }
            }
    }
}
