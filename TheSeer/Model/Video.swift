//
//  Video.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//


import Foundation

struct Video : Decodable, Identifiable {
    var id = UUID().uuidString
    var videoID : String
    var title : String
    var description : String
    var thumbnail : String
    var publishedDate : Date
    
    var sermonTitleAuthor : [String] {
        title.generate()
    }
    
    
    enum CodingKeys : String, CodingKey {
        case snippet, thumbnails, high, id
        case title, description, videoId
        case publishedDate = "publishedAt"
        case thumbnail = "url"
    }
    
    enum IdCodingKeys: String, CodingKey {
        case videoId, playlistId
    }
    
    init (from decoder: Decoder) throws {
       
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let videoIDContainer = try container.nestedContainer(keyedBy: IdCodingKeys.self, forKey: .id)
        videoID = try videoIDContainer.decode(String.self, forKey: .videoId)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        title = try snippetContainer.decode(String.self, forKey: .title)
        
        description = try snippetContainer.decode(String.self, forKey: .description)
        
        publishedDate = try snippetContainer.decode(Date.self, forKey: .publishedDate)
        
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
    }
}
