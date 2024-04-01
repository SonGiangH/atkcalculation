//
//  UIRow.swift
//  BHITrainingApp
//
//  Created by Son Giang Hong on 5/3/2024.
//

import SwiftUI

struct UIRowSmallControl: View {
    @ObservedObject var direction : Direction
    
    var title1: String? = ""
    var title2: String? = ""
    var result: String? = ""
    
    // Constructor
    init(title1: String? = nil, title2: String? = nil, result: String? = nil, direction: Direction) {
        self.title1 = title1
        self.title2 = title2
        self.result = result
        self.direction = direction
    }
    
    var body: some View {
        HStack (spacing: 0) {
                        Text(title1 ?? "")
                            .frame(width: 110, height: 20)
                            .padding()
                            .border(Color.black, width: 1) // Example border with black color
                                    
                        Text(title2 ?? "")
                            .font(.system(size: 10))
                            .frame(width: 50, height: 20)
                            .padding()
                            .border(width: 1, edges: [.top, .bottom], color: .black) // Example border with custom modifier
            
                        HStack (alignment: .center, spacing: 0) {
                            Text(result ?? "").frame(width: 110, height: 20).padding().background(Color.yellow).foregroundColor(.red).bold()
                                
                                VStack(alignment: .center, spacing: 0) {
                                    // Increase button
                                    Button(action: {
                                            // Action when the button is tapped
                                            print("Increase Value")
                                        direction.increaseSteerForce()
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
                                            print("Decrease Value")
                                        direction.decreaseSteerForce()
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
    UIRowSmallControl(direction: Direction())
}
