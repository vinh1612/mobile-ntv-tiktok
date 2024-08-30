//
//  NewFeedView.swift
//  TikTok-Clone
//
//  Created by Nguyen Thanh Vinh on 8/4/24.
//

import SwiftUI
import AVKit

struct NewFeedView: View {
    @StateObject var viewModel = FeedViewModel()
    @State private var scrollPosition: String?
    @State private var player = AVPlayer()
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .center, spacing: 0) {
                ForEach(viewModel.posts) { post in
                    NewFeedCell(post: post, player: player)
                        .id(post.id)
                        .onAppear { playInitialVideoIfNecessary() }
                }
            }
            .scrollTargetLayout()
            .scrollIndicators(.hidden)
        }
        .onAppear { player.play() }
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onChange(of: scrollPosition, { oldValue, newValue in
            playVideoOnChangeOfScrollPoisition(postId: newValue)
        })
    }
    
    func playVideoOnChangeOfScrollPoisition(postId: String?) {
        guard let currentPost = viewModel.posts.first(where: { $0.id == postId }) else { return }
        
        player.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(url: URL(string: currentPost.videoUrl)!)
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
    
    func playInitialVideoIfNecessary() {
        guard scrollPosition == nil,
              let post = viewModel.posts.first,
              player.currentItem == nil else {
            return
        }
        let playerItem = AVPlayerItem(url: URL(string: post.videoUrl)!)
        player.replaceCurrentItem(with: playerItem)
    }
}

#Preview {
    NewFeedView()
}
