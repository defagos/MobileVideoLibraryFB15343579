import AVKit
import AVFoundation
import SwiftUI

/// `AwesomeVideoPlayer` is a super-advanced video playback UI component with everything you need. Available for iOS only
/// but still super useful and essential to any iOS app.
///
/// AirPlay is automatically supported if you configure your application correctly:
///
/// - Configure your app [background modes](https://developer.apple.com/documentation/avfoundation/media_playback/configuring_your_app_for_media_playback#4182619) to support AirPlay.
/// - Configure your [audio session](https://developer.apple.com/documentation/avfoundation/streaming_and_airplay/supporting_airplay_in_your_app#2929254) category to `.playback`.
public struct AwesomeVideoPlayer: View {
    let url: URL

    @State private var player = AVPlayer()

    public var body: some View {
        VideoPlayer(player: player)
            .onAppear {
                player.replaceCurrentItem(with: .init(url: url))
                player.play()
            }
    }
    
    /// Creates an awesome player that plays the provided URL.
    public init(url: URL) {
        self.url = url
    }
}

#Preview {
    AwesomeVideoPlayer(
        url: URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8")!
    )
}
