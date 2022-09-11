//
//  Play.swift
//  meditation
//
//  Created by Apple on 19/08/2022.
//

import SwiftUI

struct playerViewButton: View {
        var systemName: String = "play"
        var fontsize : CGFloat = 25
        var color:Color =   .white
        var action: () -> Void
        var body: some View {
            Button{
                action()
            } label: {
                Image(systemName:systemName)
                    .font(.system(size:fontsize))
                    .foregroundColor(color)
              }
 }
}
struct Play_Previews: PreviewProvider {
    static var previews: some View {
        playerViewButton( action: {}).preferredColorScheme(.dark)
    }
}
