//
//  UIRowBigControl.swift
//  BHITrainingApp
//
//  Created by Son Giang Hong on 6/3/2024.
//

import SwiftUI

struct UIRowBigControl: View {
    var title1: String? = ""
    var title2: String? = ""
    var result: String? = ""
    
    // Constructor
    init(title1: String? = nil, title2: String? = nil, result: String? = nil) {
        self.title1 = title1
        self.title2 = title2
        self.result = result
    }
    
    var body: some View {
        HStack (alignment: .center, spacing: 0) {
                        Text(title1 ?? "")
                            .frame(width: 100, height: 40)
                            .padding()
                            .border(Color.black, width: 1) // Example border with black color
                            
                        Text(title2 ?? "")
                            .font(.system(size: 10))
                            .frame(width: 30, height: 40)
                            .padding()
                            .border(width: 1, edges: [.top, .bottom], color: .black)  // Example border with red color
            
                        HStack (alignment: .center) {
                            Text(result ?? "").frame(width: 70, height: 40).padding().background(Color.yellow).foregroundColor(.red).bold()
                                
                            // Toggle Control - Small
                                VStack(alignment: .center) {
                                    // Increase button
                                    Button(action: {
                                            // Action when the button is tapped
                                            print("Increase Value")
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
                                        }) {
                                            Image(Icons.arrowDown) //
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 15, height: 10) // Adjust size as needed
                                        }
                                        .padding(5)
                                        .background(Color.gray)
                                }
                                .frame(height: 40)
                                
                            
                            // Toggle Control - Big
                            VStack(alignment: .center) {
                                // Increase button
                                Button(action: {
                                        // Action when the button is tapped
                                        print("Increase Value")
                                    }) {
                                        Image(Icons.arrowUp) //
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 20, height: 10) // Adjust size as needed
                                    }
                                    .padding()
                                    .background(Color.gray)
                                Spacer()
                                // Decrease button
                                Button(action: {
                                        // Action when the button is tapped
                                        print("Decrease Value")
                                    }) {
                                        Image(Icons.arrowDown) //
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 20, height: 10) // Adjust size as needed
                                    }
                                    .padding()
                                    .background(Color.gray)
                            }
                            .frame(width: 50, height: 20)
                            
                            
                                
                        }.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                       
                    }
                    .background(Color.white) // Background color of the parent view
                    .padding()
    }
}

#Preview {
    UIRowBigControl()
}
