//
//  DotsView.swift
//  TikTok-Clone
//
//  Created by Nguyen Thanh Vinh on 11/4/24.
//

import SwiftUI

struct DotsView: View {
    var count: Int = 9
    var radius: CGFloat = 30
    var speed: Double = 0.1
    var scale: CGFloat = 1.0
    var rotation: CGFloat = 0.5

    var body: some View {
        ZStack {
            ForEach(0 ..< count, id: \.self) { idx in
                Circle()
                    .fill(Color.red)
                    .frame(width: 10)
                    .scaleEffect(self.scale)
                    .animation(.linear(duration: self.speed), value: self.scale)
                    .offset(y: -self.radius)
                    .rotationEffect(angle(index: idx))
            }
        }
    }

    func angle(index: Int) -> Angle {
        Angle(degrees: (360 / Double(self.count)) * (Double(index) + self.rotation))
    }
}

struct DotsView_Previews: PreviewProvider {
    static var previews: some View {
        DotsView()
    }
}
