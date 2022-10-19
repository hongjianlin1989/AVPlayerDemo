//
//  PlayerView.swift
//  AVPlayerDemo
//
//  Created by Hongjian Lin on 10/19/22.
//

import AVKit
import SwiftUI
import Combine

struct PlayerView: View {

    @ObservedObject var viewModel: PlayerViewModel

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(viewModel: PlayerViewModel(videoUrl: VideoEndpoint.streaming.rawValue))
    }
}
