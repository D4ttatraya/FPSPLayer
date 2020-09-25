//
//  PlayerViewController.swift
//  iOSExampleApp
//
//  Created by D4ttatraya on 23/09/20.
//

import UIKit
import AVFoundation.AVFAudio
import FPSPlayer

class PlayerViewController: UIViewController {

    var sample: Sample!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard sample != nil else {
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            self.setupPlayer()
        } catch {
            print("Error setting audio session category: \(error)")
        }
    }

    //MARK: - Private
    private var fpsPlayer: FPSPlayer!

    private func setupPlayer() {
        let config = FPSPlayerConfig()
        config.autoStartPlayback = true
        config.playerSkin = .default
        config.fpsConfig = self.sample.fpsConfig
        
        let player = FPSPlayer(config: config)
        player.addCallbackListener(self)
        let asset = FPSPlayerHLSAsset(asset: self.sample.url)
        player.setHLSAsset(asset)
        
//        let newVC = player.playerViewController!
//        newVC.modalPresentationStyle = .overFullScreen
//        self.present(newVC, animated: false, completion: nil)
        let playerView = FPSPlayerView(player: player, frame: self.view.bounds)
        playerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.addSubview(playerView)
        self.view.bringSubviewToFront(playerView)
        
        self.fpsPlayer = player
    }
    
    private func cleanupPlayer() {
        DispatchQueue.main.async {
            self.fpsPlayer = nil
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension PlayerViewController: FPSPlayerCallbacks {
    
    func fpsPlayer(_ player: FPSPlayer, finishedPlayingAsset: Asset) {
        self.cleanupPlayer()
    }
    
    func fpsPlayer(_: FPSPlayer, abortedPlayingAsset: Asset?) {
        self.cleanupPlayer()
    }
    
    func fpsPlayer(_ player: FPSPlayer, errorOccurredForAsset: Asset, error: Error) {
        print(error)
        self.cleanupPlayer()
    }
    
}

