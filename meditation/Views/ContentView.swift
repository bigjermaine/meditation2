//
//  ContentView.swift
//  meditation
//
//  Created by Apple on 30/07/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        mediatationView(meditationvm: meditationviewModel(meditation:Meditation.data))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AudioManager())
    }
}
