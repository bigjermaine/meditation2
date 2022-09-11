//
//  playerview.swift
//  meditation
//
//  Created by Apple on 01/08/2022.
//

import SwiftUI


struct playerview: View {
    @EnvironmentObject var audiomanager:AudioManager

    
    var meditationvm:meditationviewModel
    
    var ispreview: Bool = false
    
    @State private var value:Double =  0.0
    
    @State private var  isEditing:  Bool = true
    @Environment(\.dismiss)  var dismiss
    
    
    let timer = Timer
        .publish(every: 0.5,  on: .main, in:.common )
        .autoconnect()
    var body: some View {
        ZStack {
            Image(meditationvm.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(width:UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            VStack(alignment:.leading,spacing:20)
            {
                HStack {
                Button{
                    audiomanager.stop()
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 26))
                        .foregroundColor(.white)
                  }
                    Spacer()
                       }
                Text(meditationvm.meditation.title).font(.title
                    )
                    .foregroundColor(.white)
                  Spacer()
                
                if let player = audiomanager.player {
                    
                    VStack(spacing:0){
                        Slider(value:$value,in: 0...player.duration){editing in
                            
                            isEditing = editing
                            if !editing{
                                player.currentTime =  value
                            }
                        }
                            .accentColor(.white)
                    }
                    HStack{
                        Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0.00")
                        Spacer()
                        Text(DateComponentsFormatter.positional.string(from: player.duration  -   player.currentTime)  ?? "0.00")
                    }
                    .foregroundColor(.white)
                    HStack{
                        
                        let color:Color = audiomanager.islooping ?  .teal :.white
                        
                        playerViewButton(systemName: "repeat" , color:color) {
                            audiomanager.toogleloop()
                        }
                        Spacer()
                        playerViewButton(systemName: "gobackward.10") {
                            audiomanager.back()
                        }
                        Spacer()
                        playerViewButton(systemName: audiomanager.isPlaying ? "pause.circle.fill"  : "play.circle.fill"){
                            audiomanager.playPause()
                        }
                        Spacer()
                        playerViewButton(systemName:"goforward.10") {
                            player.currentTime += 10
                        }
                        Spacer()
                        playerViewButton(systemName:"stop.fill"){
                            audiomanager.stop()
                        }
                        
                    }
                    
                }
                
            }
            .padding(20)
            
        }
        .onAppear{
            //                AudioManager.shared.startPlayer(track: meditationvm.meditation.track,
            //            isPreview: ispreview)
            audiomanager.startPlayer(track: meditationvm.meditation.track,
                                     isPreview: ispreview)
        }
        .onReceive (timer) { _ in
            guard let player = audiomanager.player, isEditing else {return}
            
            value = player.currentTime
        }
        
    }
}
struct playerview_Previews: PreviewProvider {
    static let meditationVM = meditationviewModel(meditation: Meditation.data)
    static var previews: some View {
        playerview(meditationvm:meditationVM,ispreview: true).environmentObject(AudioManager())
    }
}

