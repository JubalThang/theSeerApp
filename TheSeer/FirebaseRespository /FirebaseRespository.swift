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
    @Published var dailyBibleVerseURL = ""
    init() {
       
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
        
        db.collection("daily_bible_verse").document("daily_verse").getDocument { (document, error) in
            if let document = document, document.exists {
                do {
                    if let bibleVerseModel = try document.data(as: DailyBibleVerse.self){
                        self.dailyBibleVerseURL = bibleVerseModel.imageURL
                    }
                } catch let err {
                    print("Error ecoding the document : \(err.localizedDescription)")
                }
                
            } else {
                print("Document does not exit")
            }
        }
    }
}
