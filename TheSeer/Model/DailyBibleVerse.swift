//
//  DailyBibleVerse.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import Foundation

struct DailyBibleVerse : Decodable {
    let imageURL : String
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "img_url"
    }
}
