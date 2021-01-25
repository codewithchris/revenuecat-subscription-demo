//
//  DetailView.swift
//  calm-mind
//
//  Created by Christopher Ching on 2020-11-24.
//

import SwiftUI
import AVKit

struct DetailView: View {
    
    @EnvironmentObject var model: MeditationModel
    @State var isPlaying = false
    @Binding var meditation: Meditation?

    var audioPlayer = AudioService()
    
    var body: some View {
        
        // If no meditation set, can't display detail
        if let meditation = meditation  {
        
            VStack(alignment: .leading, spacing: 20.0) {
                
                // Meditation Image
                Image(meditation.imageName)
                    .resizable()
                    .cornerRadius(10)
                
                // Title
                Text(meditation.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // Description
                Text(meditation.desc)
                
                // GeometryReader for button width
                GeometryReader {
                    reader in
                    
                    // Button stack
                    VStack {
                        
                        // Play button
                        Button(action: {
                            if !isPlaying {
                                audioPlayer.playSample()
                            }
                            else {
                                audioPlayer.stopSample()
                            }
                            isPlaying.toggle()
                        }, label: {
                            
                            if !isPlaying {
                                Text(model.userPurchases[meditation.productId!] == nil && model.allAccess == false ? "Play Sample" : "Play")
                            }
                            else {
                                Text("Stop")
                            }
                        })
                        .frame(width: reader.size.width - 40, height: 30, alignment: .center)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(15)
                        
                        // If user hasn't purchased, show Buy button
                        if model.userPurchases[meditation.productId!] == nil && model.allAccess == false {
                            Button(action: {
                                
                                model.makePurchase(meditation: meditation)
                                
                            }, label: {
                                
                                    Text("Buy")
                                
                            })
                            .frame(width: reader.size.width - 40, height: 30, alignment: .center)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(15)
                        }
                        
                        if model.allAccess == false {
                            Button(action: {
                                
                                // Buy subscription
                                model.makeSubscriptionPurchase()
                                
                            }, label: {
                                
                                    Text("Buy Subscription")
                                
                            })
                            .frame(width: reader.size.width - 40, height: 30, alignment: .center)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(15)
                        }
                    }
                }
                
                
            }.padding()
        }
    }
    
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(meditation: Binding.constant(Meditation.TestData()[0]))
            .environmentObject(MeditationModel())
    }
}
