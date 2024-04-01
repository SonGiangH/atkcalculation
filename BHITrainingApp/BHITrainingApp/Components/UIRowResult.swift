//
//  UIRowResult.swift
//  BHITrainingApp
//
//  Created by Son Giang Hong on 6/3/2024.
//

import SwiftUI

struct UIRowResult: View {
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
            
            Text(result ?? "")
                .frame(width: 110, height: 20)
                .padding().background(Color.gray)
                .foregroundColor(.black).bold()
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
            
        }.background(Color.white)
    }
    
    #Preview {
        UIRowResult(direction: Direction())
    }
}
