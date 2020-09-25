//
//  Samples.swift
//  iOSExampleApp
//
//  Created by D4ttatraya on 23/09/20.
//

import Foundation
import FPSPlayer

protocol Sample {
    var url: URL { get }
    var title: String { get }
    var info: String? { get }
    var fpsConfig: FPSConfig? { get }
}

struct BigBunnySample: Sample {
    let url: URL = URL(string: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8")!
    let title: String = "Big Buck Bunny"
    let info: String? = "Non-FPS Sample"
    var fpsConfig: FPSConfig?
}

let AllSamples: [Sample] = [BigBunnySample()]
