//
//  ContentView.swift
//  MasonMusicPlayer
//
//  Created by Jeffery Mason on 1/30/21.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    
    @State var audioPlayer: AVAudioPlayer!
    @State var count = 1
    
    var body: some View {
        
        ZStack {
            
            Color("backgroundblue")
            
            VStack {
                
                HStack {
                    
                    VStack {
                        
                        Text("Music Player")
                            
                            .font(.system(size: 45))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).multilineTextAlignment(.center)
                            .foregroundColor(Color("titlecolor"))
                            .padding(25)
                        Image("folklore")
                            .padding(25)
                        //                            .resizable()
                        //                            .scaledToFit()
                        
                    }
                    
                    
                }
                
                HStack {
                    
                    HStack {
                        
                        Button(action: {
                            self.audioPlayer.play()
                        }) {
                            Image("playbutton")
                                .resizable()
                                .scaledToFill() //
                                .frame(width: 60.0, height:60)
                        }
                        
                        Button(action: {
                            self.audioPlayer.pause()
                        }) {
                            Image("pausebutton")
                                .resizable()
                                .scaledToFill() //
                                .frame(width: 60.0, height:60)
                        }
                        
                        Button(action: {
                            if self.count < 3 {
                                self.count += 1
                            } else {
                                self.count = 1
                            }
                            let sound = Bundle.main.path(forResource: "song\(self.count)", ofType: "mp3")
                            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                            self.audioPlayer.play()
                            
                        }) {
                            Image("nextbutton")
                                .resizable()
                                .scaledToFill() //
                                .frame(width: 60.0, height:60)
                        }
                    }
                    
                }
                
                
            }
            
            .onAppear {
                let sound = Bundle.main.path(forResource: "song1", ofType: "mp3")
                self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
            
    }
}
