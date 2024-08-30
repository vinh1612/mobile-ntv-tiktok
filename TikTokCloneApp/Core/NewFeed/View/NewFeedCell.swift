//
//  NewFeedCell.swift
//  TikTok-Clone
//
//  Created by Nguyen Thanh Vinh on 8/4/24.
//

import SwiftUI
import AVKit

struct NewFeedCell: View {
    
    @State private var scale = 1.0
    @State private var opacity = 0.0
    @State private var isLove = false
    @State private var loveCount = 27
    
    @State private var isBookMark = false
    @State private var offset: CGFloat = -UIScreen.main.bounds.width
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var rotation: CGFloat = 0
    
    let post: Post
    var player: AVPlayer
    
    init(post: Post, player: AVPlayer) {
        self.post = post
        self.player = player
    }
    
    var body: some View {
        ZStack {
            CustomViewPlayer(player: player)
                .containerRelativeFrame([.horizontal, .vertical])
            
            VStack {
                Spacer()
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text("@karennne")
                                .fontWeight(.semibold)
                            Text("· 1-28")
                                .foregroundStyle(.gray)
                        }
                        
                        Text("The most satisfying Job #fyp #satisfying #roadmarking!")
                        
                        HStack {
                            Image("icon-music-light-gray")
                            MarqueeText(text: "Just Good Music 24/7 Stay See Live Radio 🎧",
                                        font: .systemFont(ofSize: 14, weight: .regular))
                        }
                    }
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    
                    Spacer()
                    
                    VStack(spacing: 28) {
                        Circle()
                            .frame(width: 48, height: 48)
                            .foregroundColor(.gray)
                            .overlay(alignment: .bottom, content: {
                                Image(systemName: "plus")
                                    .bold()
                                    .imageScale(.small)
                                    .padding(5)
                                    .background(.red)
                                    .clipShape(Circle())
                                    .offset(y: 10)
                            })
                            
                        Button {
                            isLove.toggle()
                            if isLove {
                                loveCount += 1
                            } else {
                                loveCount -= 1
                            }
                        } label: {
                            VStack {
                                Image(isLove ? "icon-heart-active" : "icon-heart-deactive")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .overlay(
                                        Group {
                                            DotsView(count: 9, radius: 25, speed: 0.3, scale: self.isLove ? 0.1 : 0.8, rotation: 0.3)
                                            DotsView(count: 9, radius: 30, speed: 0.4, scale: self.isLove ? 0.1 : 0.6, rotation: 0.6)
                                        }
                                            .opacity(self.opacity)
                                    )
                                    .onChange(of: isLove) { oldIsLove, newIsLove in
                                        if newIsLove {
                                            withAnimation(.linear(duration: 0.3)) {
                                                self.opacity = 1
                                            }
                                            withAnimation(.linear(duration: 0.1).delay(0.2)) {
                                                self.opacity = 0
                                            }
                                        }
                                    }
                                
                                Text("\(loveCount)")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                            }
                        }
                        
                        Button {
                            
                        } label: {
                            VStack {
                                Image("icon-message-light-gray")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                Text("27")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                            }
                        }
                        
                        Button {
                            isBookMark.toggle()
                        } label: {
                            Image(isBookMark ? "icon-bookmark-active" : "icon-bookmark-deactive")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                        }
                        
                        Button {
                            
                        } label: {
                            Image("icon-share-light-gray")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                        }
                        
                        ZStack {
                            Image("icon-ellipse-cd-black")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 49, height: 49)
                                .rotationEffect(.degrees(rotation))
                            Image("icon-default-cd")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 27, height: 27)
                                .rotationEffect(.degrees(rotation))
                        }
                        .onReceive(timer) { _ in
                            withAnimation(.linear(duration: 2.5)) {
                                rotation += 100
                            }
                        }
                        .onDisappear {
                            timer.upstream.connect().cancel()
                        }
                    }
                }
                .padding(.bottom, 80)
            }
            .padding()
        }
        .onTapGesture {
            switch player.timeControlStatus {
            case .paused:
                player.play()
            case .waitingToPlayAtSpecifiedRate:
                break
            case .playing:
                player.pause()
            @unknown default:
                break
            }
        }
    }
}

#Preview {
    NewFeedCell(post: Post(id: NSUUID().uuidString, videoUrl: ""), player: AVPlayer())
}
