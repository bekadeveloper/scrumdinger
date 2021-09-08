//
//  AVPlayerExtension.swift
//  Scrumdinger
//
//  Created by Beka on 08.09.2021.
//

import Foundation
import AVFoundation

extension AVPlayer {
    static let sharedDingPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "wav") else { fatalError("Failed to find the sound file") }
        return AVPlayer(url: url)
    }()
}
