//
//  Card.swift
//  calm-mind
//
//  Created by Christopher Ching on 2020-11-24.
//

import SwiftUI

struct Card: View {
    
    var meditation:Meditation
    
    var body: some View {
        
        GeometryReader { reader in
            
            // Background Image
            Image(meditation.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: reader.size.width, height: 400, alignment: .center)
                .cornerRadius(15)
            
            // Text Stack
            VStack(alignment: .leading, spacing: 10.0) {
                
                // Title
                Text(meditation.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // Description
                Text(meditation.desc)
            }
            .padding([.top, .leading], 20.0)
            .shadow(color: .black, radius: 10, x: 2, y: 2)
            
            // Chevron
            Image(systemName: "chevron.right")
                .font(.largeTitle)
                .position(x: reader.size.width - 40, y: reader.size.height - 50)
        }
        .foregroundColor(Color.white)
        .frame(width: .infinity, height: 400, alignment: .center)
        .clipped()
        .cornerRadius(15)
        .padding([.leading, .trailing])
        
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        
        Card(meditation: Meditation.TestData()[0])
    }
}
