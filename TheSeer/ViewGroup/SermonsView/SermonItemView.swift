//
//  SermonItemView.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct SermonItemView: View {
    var video : Video
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                WebImage(url: URL(string: video.thumbnail))
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 90, height: 60)
                    //                    .aspectRatio(1.78, contentMode: .fill)
                    .imageScale(.large)
                    .shadow(radius: 2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                )
                    .cornerRadius(10)
                    .shadow(color: .blue, radius: 2, x: 2, y: 3)
                
                VStack(alignment: .leading, spacing: 5) {
                    if !video.sermonTitleAuthor.isEmpty {
                        VStack(alignment: .leading, spacing: 5){
                            Text(video.sermonTitleAuthor.first!)
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(video.sermonTitleAuthor.last!)
                                .font(.subheadline)
                                .foregroundColor(Color.blue)
                        }
                    } else {
                        Text("\(video.title)")
                            .foregroundColor(.primary)
                            .font(.headline)
                    }
                    
                    HStack {
                        Spacer()
                        Text(video.publishedDate.dateToString())
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.secondary)
                    }
                }
                
            }
           
            Divider()
        }
        
        .padding(.horizontal,8)
        
    }
}
