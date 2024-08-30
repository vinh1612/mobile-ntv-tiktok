//
//  CurrentUserProfieView.swift
//  TikTok-Clone
//
//  Created by Nguyen Thanh Vinh on 10/4/24.
//

import SwiftUI

struct CurrentUserProfieView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 2) {
                    ProfileHeaderView()
                    
                    PostGridView()
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CurrentUserProfieView()
}
