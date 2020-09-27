//
//  CurrentPlayingView.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import SwiftUI

struct CurrentPlayingView: View {
    let video : Video
    var body: some View {
        ScrollView {
            VStack {
                SermonVideoPlayerView(videoId: video.videoID)
                    .aspectRatio(1.78, contentMode: .fit)
                    .frame(height: 250)
                
                if !video.sermonTitleAuthor.isEmpty {
                    
                    VStack(spacing: 30) {
                        Text(video.sermonTitleAuthor.first!)
                            .font(.title)
                            .padding(.top, 30)
                        
                        Text(video.sermonTitleAuthor.last!)
                            .font(.headline)
                            .foregroundColor(Color(.systemBlue))
                        
                       
                    }
                } else {
                    Text(video.title)
                        .font(.title)
                        .padding(.top, 30)
                }
                HStack {
                    Spacer()
                    Text(video.publishedDate.dateToString())
                        .font(.subheadline)
                        .foregroundColor(Color.blue.opacity(0.9))
                    .padding(30)
                }
                
                Spacer()
            }
        }
    }
}

//struct CurrentPlayingView_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrentPlayingView()
//    }
//}
