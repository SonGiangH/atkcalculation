//
//  WalkForceUI.swift
//  BHITrainingApp
//
//  Created by Son Giang Hong on 7/3/2024.
//

import SwiftUI

struct WalkForceController: View {
    @ObservedObject var direction : Direction
    
    
    var body: some View {
        HStack (spacing: 0) {
                        Text("Walk Force")
                            .frame(width: 110, height: 20)
                            .padding()
                            .border(Color.black, width: 1) // Example border with black color
                                    
                        Text("%")
                            .font(.system(size: 10))
                            .frame(width: 50, height: 20)
                            .padding()
                            .border(width: 1, edges: [.top, .bottom], color: .black) // Example border with custom modifier
            
                        HStack (alignment: .center, spacing: 0) {
                            Text("\(String(format: "%.2f",direction.walkForce))").frame(width: 110, height: 20).padding().background(Color.yellow).foregroundColor(.red).bold()
                                
                                VStack(alignment: .center, spacing: 0) {
                                    // Increase button
                                    Button(action: {
                                            // Action when the button is tapped
                                        direction.increaseWalkForce()
                                        }) {
                                            Image(Icons.arrowUp) //
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 15, height: 10) // Adjust size as needed
                                        }
                                        .padding(5)
                                        .background(Color.gray)
                                    Spacer()
                                    // Decrease button
                                    Button(action: {
                                            // Action when the button is tapped
                                        direction.decreaseWalkForce()
                                        
                                        }) {
                                            Image(Icons.arrowDown) //
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 15, height: 10) // Adjust size as needed
                                        }
                                        .padding(5)
                                        .background(Color.gray)
                                }
                                .frame(height: 20)
                                
                        }.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                       
                    }
                    .background(Color.white) // Background color of the parent view
                    
    }
}

#Preview {
    WalkForceController(direction: Direction())
}
