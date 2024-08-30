//
//  UserStartView.swift
//  TikTok-Clone
//
//  Created by Nguyen Thanh Vinh on 10/4/24.
//

import SwiftUI

struct UserStartView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.caption)
                .fontWeight(.semibold)
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .frame(width: 80, alignment: .center)
    }
}

#Preview {
    UserStartView(value: 5, title: "Followers")
}
