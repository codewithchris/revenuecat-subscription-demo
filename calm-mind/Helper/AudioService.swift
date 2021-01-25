//
//  AudioManager.swift
//  calm-mind
//
//  Created by Christopher Ching on 2020-11-24.
//

import Foundation
import AVKit

class AudioService {
    
    var audioPlayer:AVAudioPlayer?
    
    func playSample() {
        
        do {
            let path = Bundle.main.path(forResource: "sample", ofType: "mp3")
            
            if let path = path {
                let url = URL(fileURLWithPath: path)
                
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
        }
        catch {
            
        }
    }
    func stopSample() {
        audioPlayer?.stop()
    }
}
