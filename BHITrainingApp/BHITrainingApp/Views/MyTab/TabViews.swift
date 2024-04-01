//
//  TabViews.swift
//  BHITrainingApp
//
//  Created by Son Giang Hong on 7/3/2024.
//

import SwiftUI

struct TabViews: View {
    @State private var tabSelection = 1
    @ObservedObject var direction: Direction = Direction()
    
    
    var body: some View {
        
        
        TabView(selection: $tabSelection) {
            SteerModeUI()
                .environmentObject(direction)
                .tag(1)
            
            HoldModeUI()
                .environmentObject(direction)
                .tag(2)
            
            Text("ATK Sheet")
                .tag(3)
        }
        .overlay(alignment: .bottom) {
            CustomTabView(tabSelection: $tabSelection)
        }
    }
}

#Preview {
    TabViews()
}
