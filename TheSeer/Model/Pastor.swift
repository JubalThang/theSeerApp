//
//  Pastor.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import Foundation
import FirebaseFirestoreSwift

struct Pastor : Identifiable , Codable{
    @DocumentID var id : String?
    let userId : String?
    let name : String
    let img_url : String
    let bio : String
}

#if DEBUG
    let pastorExample = Pastor(id: "ID", userId: "UserID", name: "Rev.????", img_url: "Image URL", bio: "Bio paragraph")
#endif


struct DailyBibleVerse : Codable {
    let imageURL : String
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "img_url"
    }
}
