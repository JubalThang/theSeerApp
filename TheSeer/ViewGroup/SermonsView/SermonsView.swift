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
    @State private var isShowingAllVideos = false
    
    @State private var sermonHomeVideos = [Video]()
    var body: some View {
        GeometryReader { rader in
            ScrollView {
                VStack {
                    if youtubeModel.videos.isEmpty {
                        VStack {
                        Text("Please turn on your internet to update the videos")
                            .padding()
                        Text("\(youtubeModel.errorString)")
                        }
                    } else {
                        if self.youtubeModel.errorString.isEmpty {
                            NavigationLink(destination: CurrentPlayingView(video: self.youtubeModel.videos[0]), isActive: self.$isVideoPlaying) {
                                MostRecentSermonView(video: self.youtubeModel.videos[0], height: CGFloat(rader.size.height / 3))
                                    .modifier(PlayVideoOverlayButton(isPlaying: self.$isVideoPlaying))
                            }
                            SermonRowView(videos: Array(self.sermonHomeVideos.dropFirst()))
                        } else {
                            Text("တောင်းပန်ပါတယ် System ပိုင်းဆိုင်ရာအားနည်းမှုဖြစ်နေပါသည်။ နောက်တစ်ဖန်ကြိုးစားပေးပါ။ ကျေးဇူးတင်ပါသည်။")
                                .foregroundColor(.red)
                                .font(.title)
                                .lineSpacing(10.0)
                                .padding(.top, 10.0)
                        }
                    }
                    Button(action: {
                        self.isShowingAllVideos.toggle()
                    }, label: {
                            Text("Load More")
                                .padding(5)
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .background(Color.yellow.opacity(0.3))
                                .padding()
                                .cornerRadius(3.0)
                    })
                    NavigationLink(
                        destination: SermonRowView(videos: youtubeModel.videos),
                        isActive: $isShowingAllVideos,
                        label: {
                            EmptyView()
                        })
                }
            }
        }
        .onAppear(perform: {
            self.sermonHomeVideos = self.youtubeModel.videos.chunked(int: 10)
        })
    }
}

struct SermonsView_Previews: PreviewProvider {
    static var previews: some View {
        SermonsView()
    }
}
