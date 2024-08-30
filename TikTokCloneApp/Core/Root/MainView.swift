//
//  MainView.swift
//  TikTok-Clone
//
//  Created by Nguyen Thanh Vinh on 8/4/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var vm = selectedManager()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            switch vm.selectedTabBar {
            case .home:
                NewFeedView()
            case .friend:
                ExploreView()
            case .upload:
                Text("Upload Post")
            case .notification:
                NotificationView()
            default:
                CurrentUserProfieView()
            }
            VStack {
                HStack(spacing: 20) {
                    ForEach(itemTabs) { item in
                        Button(action: {
                            withAnimation{
                                vm.selectedBar = item.bar
                            }
                        }, label: {
                            Text(item.titleBar)
                                .font(.system(size: 18, weight: .semibold))
                        })
                        .foregroundColor(vm.selectedBar == item.bar ? .white : .gray)
                    }
                }
                .opacity(vm.selectedTabBar == .home ? 1.0 : 0.0)
                .overlay(content: {
                    if vm.selectedTabBar == .home {
                        HStack {
                            if vm.selectedBar == .foryou { Spacer() }
                            Rectangle()
                                .frame(width: 40, height: 4)
                                .offset(x: vm.selectedBar == .foryou ? 20 : -20, y: 20)
                                .foregroundColor(.white)
                            if vm.selectedBar == .following { Spacer() }
                        }
                        .padding(.leading, 8)
                        .frame(width: 140)
                    }
                })
                 
                Spacer()
                
                HStack {
                    ForEach(itemTabBars) { item in
                        Spacer()
                        Button {
                            withAnimation {
                                vm.selectedTabBar = item.tabBar
                            }
                        } label: {
                            if item.tabBar == .upload {
                                Image(vm.selectedTabBar == .home || vm.selectedTabBar == .friend ? "icon-plus-tiktok-light" : "icon-plus-tiktok-dark")
                            } else {
                                VStack {
                                    Image(vm.selectedTabBar == item.tabBar ? item.imageActive : item.imageDeactive)
                                        .frame(width: 28, height: 28)
                                    Text(item.titleTabBar)
                                        .font(.system(size: 10, weight: .semibold))
                                        .foregroundColor(vm.selectedTabBar == item.tabBar ?
                                            (vm.selectedTabBar == .home || vm.selectedTabBar == .friend ? .white : .black) :
                                            .gray
                                        )
                                }
                            }
                        }
                        Spacer()
                    }
                }
                .background(vm.selectedTabBar == .home || vm.selectedTabBar == .friend ? Color.black : Color.white)
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
