//
//  SermonRowView.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import SwiftUI

struct SermonRowView: View {
  let videos : [Video]
    var body: some View {
        ScrollView {
                ForEach(videos) { video in
                     NavigationLink(destination: CurrentPlayingView(video: video)) {
                        SermonItemView(video: video)
                    }
            }
        }
    }
}
