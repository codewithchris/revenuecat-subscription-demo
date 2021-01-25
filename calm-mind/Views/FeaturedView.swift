//
//  ContentView.swift
//  calm-mind
//
//  Created by Christopher Ching on 2020-11-23.
//

import SwiftUI

struct FeaturedView: View {
    
    @EnvironmentObject var model: MeditationModel
    @State var showDetail = false
    @State var selectedMeditation: Meditation? = nil
    
    var body: some View {
        
        // Header text
        VStack(alignment: .leading) {
            Text("Meditations")
                .font(.largeTitle).fontWeight(.heavy).padding([.leading])
            
            ScrollView {
                
                LazyVStack(alignment: .leading, spacing: 20, pinnedViews: []) {
                    
                    ForEach(model.meditations) { m in
                        
                        Button(action: {
                            
                            // Set selected meditation for the detail
                            self.selectedMeditation = m
                            
                            // Toggle flag to show detail
                            self.showDetail.toggle()
                            
                        }) {
                            
                            // Each meditation card in the scrollview
                            Card(meditation: m)
                        }
                        .sheet(isPresented: $showDetail, content: {
                            
                            // Shows the detail
                            DetailView(meditation: $selectedMeditation)
                        })
                        
                    }
                }
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
            .environmentObject(MeditationModel())
    }
}
