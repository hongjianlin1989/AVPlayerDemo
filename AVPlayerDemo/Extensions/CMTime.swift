//
//  CMTime.swift
//  AVPlayerDemo
//
//  Created by Hongjian Lin on 10/19/22.
//

import Foundation
import CoreMedia

extension CMTime {
    static func getHalfSecondTime() -> CMTime {
        return CMTimeMake(value: 1, timescale: 2)
    }

    func toDouble() -> Double {
        return round(CMTimeGetSeconds(self) * 10) / 10.0
    }
}
