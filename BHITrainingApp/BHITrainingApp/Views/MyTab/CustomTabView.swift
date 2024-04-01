//
//  CustomTabView.swift
//  BHITrainingApp
//
//  Created by Son Giang Hong on 7/3/2024.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    
    let tabItems: [(image: String, title: String)] = [
            ("calculator", "Steer Mode"),
            ("calculator", "Hold Mode"),
            ("sheets", "ATK Sheet")
    ]
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 80)
                .foregroundColor(Color(.secondarySystemBackground))
                .shadow(radius: 2)
            
            HStack {
                ForEach(0..<3) { index in
                    
                    Button(action: {
                        tabSelection = index + 1
                    }, label: {
                        VStack(spacing: 0) {
                            Spacer()
                            
                            Image(tabItems[index].image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 40)
                            
                            Text(tabItems[index].title)
                                .font(.caption)
                                .padding(.vertical, 4)
                                .bold()
                            
                            if index + 1 == tabSelection {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                    .matchedGeometryEffect(id: "selectedTabId", in: animationNamespace)
                                    .offset(y: 3)
                            } else {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(.clear)
                                    .offset(y: 3)
                            }
                        }
                        .foregroundColor(index + 1 == tabSelection ? .blue : .gray)
                    })
                }
            }.frame(height: 80)
                .clipShape(Capsule())
        }
        .padding(.horizontal)
    }
}

#Preview {
    CustomTabView(tabSelection: .constant(1))
        .previewLayout(.sizeThatFits)
        .padding(.vertical)
}
