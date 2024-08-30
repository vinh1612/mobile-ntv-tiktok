//
//  HomeModel.swift
//  TikTok-Clone
//
//  Created by Nguyen Thanh Vinh on 19/4/24.
//

import Foundation

class selectedManager: ObservableObject {
    @Published var titleBar = ""
    @Published var titleTabBar = ""
    @Published var imageActive = ""
    @Published var imageDeactive = ""
    @Published var selectedBar: Bar = .following
    @Published var selectedTabBar: TabBar = .home
}

enum Bar : String {
    case following
    case foryou
    
    var title: String {
        switch self {
        case .following:
            return "Đang theo dỗi"
        case .foryou:
            return "Dành cho bạn"
        }
    }
}

enum TabBar : String {
    case home
    case friend
    case upload
    case notification
    case profile
}

struct ModelTab: Identifiable {
    var id = UUID()
    var titleBar: String
    var bar: Bar
}

struct ModelTabBar: Identifiable {
    var id = UUID()
    var titleTabBar: String
    var imageActive: String
    var imageDeactive: String
    var tabBar: TabBar
}

var itemTabs: [ModelTab] = [
    ModelTab(titleBar: "Đang theo dỗi", bar: .following),
    ModelTab(titleBar: "Dành cho bạn", bar: .foryou)
]

var itemTabBars: [ModelTabBar] = [
    ModelTabBar(titleTabBar: "Trang chủ", imageActive: "icon-home-active", imageDeactive: "icon-home-deactive", tabBar: .home),
    ModelTabBar(titleTabBar: "Bạn bè", imageActive: "icon-person-two-active", imageDeactive: "icon-person-two-deactive", tabBar: .friend),
    ModelTabBar(titleTabBar: "", imageActive: "", imageDeactive: "", tabBar: .upload),
    ModelTabBar(titleTabBar: "Thông báo", imageActive: "icon-message-active", imageDeactive: "icon-message-deactive", tabBar: .notification),
    ModelTabBar(titleTabBar: "Hồ sơ", imageActive: "icon-person-active", imageDeactive: "icon-person-deactive", tabBar: .profile)
]
