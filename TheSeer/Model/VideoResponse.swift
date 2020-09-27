//
//  VideoResponse.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import Foundation

struct VideoResponse : Decodable {
    var items : [Video]?
    var etag : String
    
    enum CodingKeys : String, CodingKey {
        case items, etag
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
        
        etag = try container.decode(String.self, forKey: .etag)
    }
}
