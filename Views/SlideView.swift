//
//  SlideView.swift
//  TechUniFest
//
//  Created by Yu Takahashi on 10/2/24.
//

import SwiftUI

struct SlideView: View {
    @State private var autoSlideTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State private var slideIndex = 0
    @Binding var isSlideshowShown: Bool
    @Binding var slideshowTimer: TimerPublisher
    
    var body: some View {
        TabView(selection: $slideIndex) {
            ForEach(Array(slides.enumerated()), id: \.offset) { index, slide in
                Image(slide)
                    .resizable()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .scaledToFit()
                    .tag(index)
            }
        }
        .background(Color(.systemBackground))
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onReceive(autoSlideTimer) { _ in
            withAnimation(.easeInOut) {
                if slideIndex == slides.count - 1 {
                    slideIndex = 0
                } else {
                    slideIndex += 1
                }
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                isSlideshowShown = false
            }
            autoSlideTimer.upstream.connect().cancel()
            slideshowTimer = Timer.publish(every: 30, on: .main, in: .common).autoconnect()
        }
        .onLongPressGesture {
            
        }
        .statusBarHidden()
        .prefersHomeIndicatorAutoHidden(true)
    }
}
