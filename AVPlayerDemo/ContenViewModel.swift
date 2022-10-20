//
//  ContenViewModel.swift
//  AVPlayerDemo
//
//  Created by Hongjian Lin on 10/19/22.
//

import Foundation
import Combine

class ContenViewModel {
    var playerViewModel: PlayerViewModel?
    private var cancellables: Set<AnyCancellable> = []

    init() {
        if let url = URL(string: VideoEndpoint.streaming.rawValue) {
            playerViewModel = PlayerViewModel(videoUrl: url, delegate: self)
        }
    }
}

extension ContenViewModel: PlayerPlayBackDelegate {
    func didReviceEventWithState(state: PlayerViewModel.PlayBackState) {
        switch state {
        case .initial:
            break
        case .play:
            print("playing")
        case .pause:
            print("pause")
        case .time(let second):
            print("current time is: \(second)")
            
        }
    }
}
