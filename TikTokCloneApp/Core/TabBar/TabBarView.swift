//
//  TabBarView.swift
//  TikTok-Clone
//
//  Created by Nguyen Thanh Vinh on 12/4/24.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab = 0
    
    init(selectedTab: Int) {
        self.selectedTab = selectedTab
    }
    
    var body: some View {
        Text("Hello World")
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedTab: 0)
    }
}
