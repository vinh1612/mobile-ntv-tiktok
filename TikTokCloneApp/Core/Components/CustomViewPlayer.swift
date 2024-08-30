//
//  CustomViewPlayer.swift
//  TikTok-Clone
//
//  Created by Nguyen Thanh Vinh on 10/4/24.
//

import SwiftUI
import AVKit

struct CustomViewPlayer: UIViewControllerRepresentable {
    var player: AVPlayer
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.exitsFullScreenWhenPlaybackEnds = true
        controller.allowsPictureInPicturePlayback = true
        controller.videoGravity = .resizeAspect // Make video full screen
        // Observe when the player finishes playing
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: nil) { _ in
            // Seek to the beginning of the video
            self.player.seek(to: .zero)
            // Play the video again
            self.player.play()
        }
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
