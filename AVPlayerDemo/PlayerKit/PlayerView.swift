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
        VStack{
            VideoPlayer(player: viewModel.player)
                .onAppear {
                    viewModel.playerPlay()
                }
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        if let url = URL(string: VideoEndpoint.streaming.rawValue) {
            PlayerView(viewModel: PlayerViewModel(videoUrl: url, delegate: nil))
        }
    }
}
