//
//  extension.swift
//  meditation
//
//  Created by Apple on 02/08/2022.
//

import Foundation

extension DateComponentsFormatter{
    static let abbreviated: DateComponentsFormatter = {
        print("initializing DateComponentsFormatter.abbreviated ")
        let formatter  = DateComponentsFormatter()
        
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        return formatter
    }()

static let positional : DateComponentsFormatter = {
    print("initializing DateComponentsFormatter.positional")
    let formatter  = DateComponentsFormatter()
    
    formatter.allowedUnits = [ .minute, .second]
    formatter.unitsStyle = .positional
    formatter.zeroFormattingBehavior = .pad
    return formatter
}()
}
