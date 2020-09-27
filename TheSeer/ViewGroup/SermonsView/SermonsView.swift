//
//  SermonsView.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import SwiftUI

struct SermonsView: View {
    @ObservedObject var youtubeModel = VideoViewModel()
    @State private var isVideoPlaying = false
    
    var body: some View {
        GeometryReader { rader in
            ScrollView {
                VStack {
                    if youtubeModel.videos.isEmpty {
                        Text("Please turn on your internet to update the videos")
                            .padding()
                    } else {
                        if self.youtubeModel.errorString.isEmpty {
                            NavigationLink(destination: CurrentPlayingView(video: self.youtubeModel.videos[0]), isActive: self.$isVideoPlaying) {
                                MostRecentSermonView(video: self.youtubeModel.videos[0], height: CGFloat(rader.size.height / 3))
                                    .modifier(PlayVideoOverlayButton(isPlaying: self.$isVideoPlaying))
                            }
                            SermonRowView(videos: Array(self.youtubeModel.videos.dropFirst()))
                        } else {
                            Text("တောင်းပန်ပါတယ် System ပိုင်းဆိုင်ရာအားနည်းမှုဖြစ်နေပါသည်။ နောက်တစ်ဖန်ကြိုးစားပေးပါ။ ကျေးဇူးတင်ပါသည်။")
                                .foregroundColor(.red)
                                .font(.title)
                                .lineSpacing(10.0)
                                .padding(.top, 10.0)
                        }
                    }
                }
            }
        }
    }
}

struct SermonsView_Previews: PreviewProvider {
    static var previews: some View {
        SermonsView()
    }
}
