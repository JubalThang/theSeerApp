//
//  Constants.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import Foundation
final class Constants {
    static let YOUTUBE_API_KEY = "AIzaSyB-D251TIQn2-Kk9I-fbt3_p8BxjhiU-Bk"
    static let YOUTUBE_CHANNEL_ID = "UCJppkOE__UP9s-1xoEuARRQ"// CodingThangChannel"UC09LM7a5exIpasvcdUG5EPw" DUMC Channel = UCJppkOE__UP9s-1xoEuARRQ
    static let YOUTUBE_BASE_URL = "https://www.googleapis.com/youtube/v3/search?maxResults=50&order=date&part=snippet&type=video&channelId=\(Constants.YOUTUBE_CHANNEL_ID)&key=\(Constants.YOUTUBE_API_KEY)"
}
