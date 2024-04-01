//
//  AutoTrakCal.swift
//  BHITrainingApp
//
//  Created by Son Giang Hong on 5/3/2024.
//

import SwiftUI

struct SteerModeUI: View {
    // first time use it so we have to create a state object
    @ObservedObject var direction = Direction()
    
    
    var body: some View {
        HStack(){
            VStack() {
                // Title
                Text("Steering Force Calculator v3.0b")
                // Dog Leg Gradient
                DLGView(direction: direction)
                
                // Steering Force
                SteerForceController(direction: direction)
               
                // Steering Direction
                SteerDirectionController(direction: direction)
                
                // Actual Hole Inclination
                HoleInclinationController(direction: direction)
                
                Divider()
                // Expected Dog Leg
                UIRowResult(title1: "Expected DLS", title2: "°/ 30m", result: "\(String(format: "%.1f",direction.steerDLS))", direction: direction)
                
                // Expected Build Rate
                UIRowResult(title1: "Expected BUR", title2: "°/ 30m", result: "\(String(format: "%.1f",direction.buildRate))", direction: direction)

                // Expected Walk Rate
                UIRowResult(title1: "Expected WR", title2: "°/ 30m", result: "\(String(format: "%.1f",direction.walkRate))", direction: direction)
                
                Spacer()
                Text("ATK G3 - FLEX STAB = 0.065")
                Text("ATK G3 - Mod STAB  = 0.045")
                Spacer()
                Text("STEER MODE").font(.system(size: 30)).bold()
                Spacer()
            }
        }
        .frame(
            minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center)
        .background(Color(64, 153, 121))
    }
}

#Preview {
    SteerModeUI(direction: Direction())
}
