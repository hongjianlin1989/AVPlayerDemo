//
//  PlayerViewModel.swift
//  AVPlayerDemo
//
//  Created by Hongjian Lin on 10/19/22.
//

import Foundation
import AVKit
import SwiftUI
import Combine

protocol PlayerPlayBackDelegate: AnyObject {
    func didReviceEventWithState(state: PlayerViewModel.PlayBackState)
}

class PlayerViewModel: NSObject, ObservableObject {

    enum PlayBackState {
        case initial
        case play
        case pause
        case time(second: Double)
    }

    private var videoUrl: URL
    private var timeObserverToken: Any?
    private var playBackState: PlayBackState
    weak var delegate: PlayerPlayBackDelegate?
    @Published var player: AVPlayer

    init(videoUrl: URL, delegate: PlayerPlayBackDelegate?) {
        self.videoUrl = videoUrl
        player = AVPlayer(url: videoUrl)
        playBackState = .initial
        self.delegate = delegate
        super.init()
        addObservers()
    }

    func playerPlay() {
        player.play()
    }

    func addObservers() {
        player.addObserver(self, forKeyPath: "rate", options: NSKeyValueObservingOptions(), context: nil)
        timeObserverToken = player.addPeriodicTimeObserver(forInterval: CMTime.getHalfSecondTime(),
                                                          queue: .main) {
            [weak self] time in
            guard let self = self else {
                return
            }
            self.playBackState = .time(second: time.toDouble())
            self.delegate?.didReviceEventWithState(state: self.playBackState)
        }
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "rate", let player = object as? AVPlayer {
            if player.rate == 1 {
                self.playBackState = .play
            } else {
                self.playBackState = .pause
            }
            self.delegate?.didReviceEventWithState(state: self.playBackState)
        }
    }

}
