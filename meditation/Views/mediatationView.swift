//
//  mediatationView.swift
//  meditation
//
//  Created by Apple on 30/07/2022.
//

import SwiftUI

struct mediatationView: View {
    @ObservedObject var meditationvm:meditationviewModel
    @State private var showplayer = false
    var body: some View {
        VStack{
            // MARK: image
            Image(meditationvm.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(height:UIScreen.main.bounds.height/3)
            
            // MARK: mediatation details
            ZStack(alignment:.leading){
                Color(red:24/258,green:23/258, blue:22/255)
                
                VStack(alignment:.leading, spacing:24){
                // MARK: Type and description
                
                VStack(alignment:.leading, spacing:8){
                // MARK: Type and description
                    Text("music")
                    Text(DateComponentsFormatter.abbreviated.string(from:meditationvm.meditation.duration) ??
                    meditationvm.meditation.duration.formatted() + "s")
                 }
                .font(.subheadline)
                .textCase(.uppercase)
                .opacity(0.7)
                    
                    //  MARK:Title
                    
                    Text( meditationvm.meditation.title)
                        .font(.title)
                    //  MARK:description
                    
                    Text(meditationvm.meditation.description)
                    Button{
                        showplayer = true
                        
                    } label: {
                        Label("play",systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .frame(maxWidth:.infinity)
                            .background(.white)
                            .cornerRadius(20)
                    }
                    Text("   Clear your mind  ")
                    
                    Spacer()
                }
                .foregroundColor(.white)
                .padding(20)
            }
     }
        .ignoresSafeArea()
        
        .fullScreenCover(isPresented: $showplayer)
        { playerview(meditationvm:meditationvm)
                             
      }
    }
}

struct mediatationView_Previews: PreviewProvider {
    static let meditationVM = meditationviewModel(meditation: Meditation.data)
    static var previews: some View {
        mediatationView(meditationvm: meditationVM ).environmentObject(AudioManager())
    }
}
