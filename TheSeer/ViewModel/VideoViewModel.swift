//
//  VideoViewModel.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import Foundation

class VideoViewModel : ObservableObject {
    fileprivate let youtubeAPI = YouTubeAPIService()
    @Published var videos = [Video]()
    @Published var errorString = ""
    
    init() {
        youtubeAPI.fetchYouTube { (videos, err) in
            if let err = err {
                self.errorString = err.localizedDescription
                print("VideoModel Error: \(err.localizedDescription)")
                return
            }
            self.videos = videos
        }
    }
}
