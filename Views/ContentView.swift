import SwiftUI

struct ContentView: View {
    @State private var slideshowTimer = Timer.publish(every: 30, on: .main, in: .common).autoconnect()
    @State private var isSlideshowShown = false
    
    private func transitionToSlideView() {
        withAnimation(.easeInOut) {
            isSlideshowShown = true
        }
        slideshowTimer.upstream.connect().cancel()
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HStack {
                        NavigationLink(destination: TerminalView()) {
                            Image(systemName: "apple.terminal")
                                .imageScale(.large)
                                .padding()
                        }
                        
                        NavigationLink(destination: EmptyView()) {
                            Image(systemName: "menucard")
                                .imageScale(.large)
                                .padding()
                        }
                        
                        Button {
                            transitionToSlideView()
                        } label: {
                            Image(systemName: "play.rectangle")
                                .imageScale(.large)
                                .padding()
                        }
                        
                        Spacer()
                    }
                    Spacer()
                    Text("Pythonで遊ぼう！")
                        .font(.system(size: 64))
                    Text("Let's play with Python!")
                        .font(.largeTitle)
                    
                    Spacer().frame(height: 100)
                    
                    NavigationLink(destination: PlaygroundView()) {
                        Text("はじめる")
                            .font(.title)
                            .foregroundStyle(.white)
                            .padding()
                            .frame(minWidth: 300)
                            .background(.green)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    Spacer()
                    
                    
                }
                
                if isSlideshowShown {
                    SlideView(isSlideshowShown: $isSlideshowShown, slideshowTimer: $slideshowTimer)
                }
            }
            .onReceive(slideshowTimer) { _ in
                transitionToSlideView()
            }
        }
    }
}
