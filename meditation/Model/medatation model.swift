//
//  medatation model.swift
//  meditation
//
//  Created by Apple on 02/08/2022.
//

import Foundation

final class meditationviewModel:   ObservableObject {
    private(set) var meditation: Meditation
    
    init(meditation: Meditation){
    
    self.meditation = meditation
    }
    
}
struct Meditation{
    var id = UUID()
    var title:  String
    var  description: String
    var duration: TimeInterval
    var track: String
    var image: String
    
    static let data = Meditation( title: "feel the vibes by jerm ", description: "peace of mind is important", duration: 70, track: "jermaine", image: "game")
    
    
    
}
