//
//  YouTubeAPIService.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import Foundation

class YouTubeAPIService {
    
    lazy var cache : URLCache = {
        URLCache(memoryCapacity: 0, diskCapacity: 10 * 1024 * 1024)
    }()
    
    func fetchYoutube() {
        
    }
}
