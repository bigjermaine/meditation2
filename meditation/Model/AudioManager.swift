//
//  AudioManager.swift
//  meditation
//
//  Created by Apple on 20/08/2022.
//

import SwiftUI

import  AVKit


final class  AudioManager: ObservableObject {
    //static  let shared = AudioManager()
    
    
    var player: AVAudioPlayer?
    
    @Published private (set)var isPlaying:Bool = false{
        didSet{
            print (isPlaying, "isPlaying")
        }
       
    }
    @Published private (set)var islooping:Bool = false
    
    func startPlayer(track:String, isPreview: Bool = false) {
        guard  let  url = Bundle.main.url(forResource: track, withExtension: "mp3") else { print("resource not  found: \(track) ")
            
            return
            
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode:.default)
            
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)
            
            if   isPreview {
                
                player?.prepareToPlay()
            }else{
                player?.play()
                
                isPlaying  = true
            }
            
        }catch{
            print("fial to initializer  player", error)
        }
    }
    func playPause() {
        guard let player = player else {
            return
        }
        if player.isPlaying{
            player.pause()
            
            isPlaying = false
        }
        else{
            player.play()
            isPlaying = true
        }
    }
    
    func stop() {
        guard let player = player else {
            return
        }
        if player.isPlaying{
            player.stop()
            isPlaying = false
            
            
        }
        
    }
    func back() {
        guard let player = player else {
            return
        }
        if player.isPlaying{
            player.currentTime -= 10
            isPlaying = false
            
    
  }
 }
    func toogleloop() {
        guard let player = player else {
            return
        }
        player.numberOfLoops = player.numberOfLoops ==  0 ? -1 :0
        
        islooping = player.numberOfLoops != 0
            
     print ("islooping", islooping)
  }
 }

