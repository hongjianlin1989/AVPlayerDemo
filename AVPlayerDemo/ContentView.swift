//
//  ContentView.swift
//  AVPlayerDemo
//
//  Created by Hongjian Lin on 10/19/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PlayerView(viewModel: PlayerViewModel(videoUrl: VideoEndpoint.streaming.rawValue))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
