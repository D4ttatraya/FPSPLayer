//
//  ViewController.swift
//  iOSExampleApp
//
//  Created by D4ttatraya on 23/09/20.
//

import UIKit
import AVFoundation.AVFAudio
import FPSPlayer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch {
            print("Error setting audio session category: \(error)")
        }
        
        let config = FPSPlayerConfig()
        config.autoStartPlayback = true
        config.playerSkin = .default
        
        self.fpsPlayer = FPSPlayer(config: config)
        let videoUrl = URL(string: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8")!
        self.fpsPlayer!.setHLSAsset(FPSPlayerHLSAsset(asset: videoUrl))
        
        let playerView = FPSPlayerView(player: self.fpsPlayer!, frame: self.view.bounds)
        playerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.addSubview(playerView)
        self.view.bringSubviewToFront(playerView)
    }

    private var fpsPlayer: FPSPlayer?


}

