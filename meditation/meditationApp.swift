//
//  meditationApp.swift
//  meditation
//
//  Created by Apple on 30/07/2022.
//

import SwiftUI

@main
struct meditationApp: App {
    @StateObject  var  audioManager = AudioManager()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(audioManager)
        }
    }
}
