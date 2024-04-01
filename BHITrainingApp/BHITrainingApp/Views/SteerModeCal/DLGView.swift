//
//  DLGView.swift
//  BHITrainingApp
//
//  Created by Son Giang Hong on 6/3/2024.
//

import SwiftUI

struct DLGView: View {
    @ObservedObject var direction : Direction
  
    
    var body: some View {
        HStack (spacing: 0) {
                        Text("DLG")
                            .frame(width: 110, height: 20)
                            .padding()
                            .border(Color.black, width: 1) // Example border with black color
                                    
                        Text("°/ 30m/ %")
                            .font(.system(size: 10))
                            .frame(width: 50, height: 20)
                            .padding()
                            .border(width: 1, edges: [.top, .bottom], color: .black) // Example border with custom modifier
            
                        HStack (alignment: .center, spacing: 0) {
                            Text("\(String(format: "%.3f",direction.doglegGradient))").frame(width: 110, height: 20).padding().background(Color.yellow).foregroundColor(.red).bold()
                                
                                VStack(alignment: .center, spacing: 0) {
                                    // Increase button
                                    Button(action: {
                                            // Action when the button is tapped - Increase
                                            direction.increaseDlBase()
                                            
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
                                            // Action when the button is tapped - Decrease
                                        direction.decreaseDlBase()
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
    DLGView(direction: Direction())
}
