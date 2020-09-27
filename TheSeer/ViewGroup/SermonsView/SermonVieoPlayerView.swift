//
//  SermonVieoPlayerView.swift
//  TheSeer
//
//  Created by RyzenMac on 9/26/20.
//

import SwiftUI
import youtube_ios_player_helper

struct SermonVideoPlayerView : UIViewRepresentable {
    let videoId : String
    func makeUIView(context: Context) -> ViedoHolder {
        let viewHolder = ViedoHolder()
        viewHolder.videoId = videoId
        
        return viewHolder
    }
    
    func updateUIView(_ uiView: ViedoHolder, context: Context) {
    }
}


class ViedoHolder : UIView {
    let player = YTPlayerView()
    
    let playerVars : [String : Any] = [
        "autohide" : 0,
        "playsinline" : 1
    ]
    
    var videoId : String? {
        didSet {
            player.load(withVideoId: videoId!, playerVars: playerVars)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViedoPlayer()
        player.delegate = self
    }
    
    func addViedoPlayer() {
        addSubview(player)
        player.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            player.topAnchor.constraint(equalTo: topAnchor),
            player.trailingAnchor.constraint(equalTo: trailingAnchor),
            player.bottomAnchor.constraint(equalTo: bottomAnchor),
            player.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ViedoHolder : YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
    func playerView(_ playerView: YTPlayerView, receivedError error: YTPlayerError) {
        print(playerView)
    }
    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
        switch state {
        case .unknown:
            print(state)
        case .unstarted :
            print("No Start")
        default: break
            
        }
    }
}
