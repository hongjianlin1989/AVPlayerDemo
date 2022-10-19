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

class PlayerViewModel: ObservableObject {

    @Published var videoUrl: String

    init(videoUrl: String) {
        self.videoUrl = videoUrl
    }
}
