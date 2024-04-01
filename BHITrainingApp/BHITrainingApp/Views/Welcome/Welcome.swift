//
//  Welcome.swift
//  BHITrainingApp
//
//  Created by Son Giang Hong on 4/3/2024.
//

import SwiftUI

struct Welcome: View {
    // body is method render giong trong React
    var body: some View {
//        Text("Hello Hong Son").onAppear {
////            learning()
//        }
        HStack {
            VStack  {
                Spacer()
                // First text
                Text("Robert Giang Drilling Calculation").font(.title2)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    
                /* Second text
                Text("Choose the Drilling Tools").font(.system(size: 20))
                    .foregroundColor(Color.white)
                    .onAppear() {
                        Color.doABC()
                   } */
                Spacer()
                // Image here
                Image(Images.autoTrak)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
                // Button
                Button(action: {
                    
                }) {
                                                Text("Get Calculation Here")
                                                    .font(.system(size: 15))
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.black)
                                                    .padding(10)
                                                    .background(Color.white)
                                                    .cornerRadius(10)
                                            }
                                            .frame(width: 400 ,height: 200)
                                            .buttonStyle(PlainButtonStyle())
                // Spacer
                Spacer()
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
}

#Preview {
    Welcome()
//        .preferredColorScheme(.dark)
}
