//
//  MarqueeText.swift
//  TikTok-Clone
//
//  Created by Nguyen Thanh Vinh on 12/4/24.
//

import SwiftUI

struct MarqueeText: View {
    @State var storedSize: CGSize = .zero
    @State var offset: CGFloat = 0
    
    @State var text: String
    var font: UIFont
    var animationSpeed: Double = 0.05
    var delayTime: Double = 0.5
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            Text(text)
                .font(Font(font))
                .offset(x: offset)
                .padding(.horizontal, 15)
        }
        .overlay(content: {
            HStack {
                let color:Color = .black
                LinearGradient(colors: [color, color.opacity(0.7), color.opacity(0.5), color.opacity(0.3)],
                               startPoint: .leading, endPoint: .trailing)
                    .frame(width: 20)
                
                Spacer()
                
                LinearGradient(colors: [color, color.opacity(0.7), color.opacity(0.5), color.opacity(0.3)]
                    .reversed(), startPoint: .leading, endPoint: .trailing)
                    .frame(width: 20)
            }
        })
        .disabled(true)
        .onAppear {
            let textBase = text
            (1...15) .forEach { _ in
                text.append(" ")
            }
            storedSize = textSize()
            text.append(textBase)
            let timing: Double = (animationSpeed * storedSize.width)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                withAnimation(.linear(duration: timing)) {
                    offset = -storedSize.width
                }
            })
        }
        .onReceive(Timer.publish(every: ((animationSpeed * storedSize.width) + delayTime), on: .main, in: .default).autoconnect(), perform: { _ in
            offset = 0
            withAnimation(.linear(duration: (animationSpeed * storedSize.width))) {
                offset = -storedSize.width
            }
        })
    }
    
    func textSize() -> CGSize {
        let attributes = [NSAttributedString.Key.font: font]
        let size = (text as NSString).size(withAttributes: attributes)
        return size
    }
}
