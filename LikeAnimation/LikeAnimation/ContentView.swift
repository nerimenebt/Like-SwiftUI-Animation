//
//  ContentView.swift
//  LikeAnimation
//
//  Created by Nerimene on 4/5/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK:- variables
    let animationDuration: Double = 0.25
    
    @State var isAnimating: Bool = false
    @State var shrinkIcon: Bool = false
    @State var floatLike: Bool = false
    @State var showFlare: Bool = false
    
    // MARK:- views
    var body: some View {
        ZStack {
            Color(red: 49/255, green: 28/255, blue: 78/255, opacity: 1.0)
                .edgesIgnoringSafeArea(.all)
            ZStack {
                if (floatLike) {
                    CapusuleGroupView(isAnimating: $floatLike)
                        .offset(y: -130)
                        .scaleEffect(self.showFlare ? 1.25 : 0.8)
                        .opacity(self.floatLike ? 1 : 0)
                        .animation(Animation.spring().delay(animationDuration / 2))
                }
                Circle()
                    .foregroundColor(self.isAnimating ? Color(red: 254/255, green: 140/255, blue: 100/255, opacity: 1.0) : Color(red: 64/255, green: 49/255, blue: 82/255, opacity: 1.0))
                    .animation(Animation.easeOut(duration: animationDuration * 2).delay(animationDuration))
                HeartImageView()
                    .foregroundColor(.white)
                    .offset(y: 12)
                    .scaleEffect(self.isAnimating ? 1.25 : 1)
                    .overlay(
                        Color(red: 254/255, green: 140/255, blue: 100/255, opacity: 1.0)
                            .mask(
                                HeartImageView()
                            )
                            .offset(y: 12)
                            .scaleEffect(self.isAnimating ? 1.35 : 0)
                            .animation(Animation.easeIn(duration: animationDuration))
                            .opacity(self.isAnimating ? 0 : 1)
                            .animation(Animation.easeIn(duration: animationDuration).delay(animationDuration))
                    )
            }.frame(width: 250, height: 250)
            .scaleEffect(self.shrinkIcon ? 0.35 : 1)
            .animation(Animation.spring(response: animationDuration, dampingFraction: 1, blendDuration: 1))
            if (floatLike) {
                FloatingLike(isAnimating: $floatLike)
                    .offset(y: -40)
            }
        }.onTapGesture {
            if (!floatLike) {
                self.floatLike.toggle()
                self.isAnimating.toggle()
                self.shrinkIcon.toggle()
                Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: false) { _ in
                    self.shrinkIcon.toggle()
                    self.showFlare.toggle()
                }
            } else {
                self.isAnimating = false
                self.shrinkIcon = false
                self.showFlare = false
                self.floatLike = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
