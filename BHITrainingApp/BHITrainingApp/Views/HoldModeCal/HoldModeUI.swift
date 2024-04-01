//
//  HoldModeUI.swift
//  BHITrainingApp
//
//  Created by Son Giang Hong on 7/3/2024.
//

import SwiftUI

struct HoldModeUI: View {
    @ObservedObject var direction = Direction()
    
    
    var body: some View {
        HStack(){
            VStack() {
                // Title
                Text("Steering Force Calculator v3.0b")
                
                // Dog Leg Gradient
                DLGView(direction: direction)
                
                // Actual Hole Inclination
                HoleInclinationController(direction: direction)
                
                // Target Inclination
                TargetIncController(direction: direction)
               
                // Build Force
                BuildForceController(direction: direction)
                
                // Walk Force
                WalkForceController(direction: direction)
                
                Divider()
                
                // Expected Dog Leg
                UIRowResult(title1: "Expected DLS", title2: "°/ 30m", result: "\(String(format: "%.1f",direction.holdModeDLS))", direction: direction)
                
                // Expected Build Rate
                UIRowResult(title1: "Expected BUR", title2: "°/ 30m", result: "\(String(format: "%.1f",direction.holdModeBuildRate))", direction: direction)

                // Expected Walk Rate
                UIRowResult(title1: "Expected WR", title2: "°/ 30m", result: "\(String(format: "%.2f",direction.holdModeWalkRate))", direction: direction)
                
                Spacer()
//                Text("ATK G3 - FLEX STAB = 0.065")
//                Text("ATK G3 - Mod STAB  = 0.045")
                Text("Resultant Steer Force = \(String(format: "%.1f",direction.resultantSteerForce))")
                Text("Resultant Direction = \(String(format: "%.1f",direction.resultantDirection))")

                
                Spacer()
                Text("HOLD / BUILD MODE").font(.system(size: 25)).bold()
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
    HoldModeUI(direction: Direction())
}
