//
//  DrillingTools.swift
//  BHITrainingApp
//
//  Created by Son Giang Hong on 5/3/2024.
//

import SwiftUI

struct DrillingTools: View {
    
    //State
    @State private var drillingTools:[Tool] = [
        Tool(name: "Motor"),
        Tool(name: "AutoTrakG3")
    ]
    
    @State private var showingAlert = false
    
    var isButtonDisable: Bool {
        return !(drillingTools.filter({
            $0.isSelected == true
        }).count > 0)
    }
    
    var body: some View {
        HStack() {
            VStack(alignment: .center) {
                Spacer()
                Spacer()
                Text("Select Drilling Tools for Calculation")
                
                // Drilling tools options
                HStack {
                    ForEach ($drillingTools) { $tool in
                                                
                        Button(action: {
                            
                            print("You choose \(tool.name)")
                            drillingTools = drillingTools.map {
                                var cloneTool = $0  // nhan ban, clone
                                cloneTool.isSelected = tool.name == cloneTool.name
                                return cloneTool
                            }
                            showingAlert = true
                        }) {
                            VStack{
                                Text(tool.name).bold().font(.title3).foregroundColor(.black)
                                
                                Image(tool.name)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                
                                Image(tool.isSelected == true ? Icons.radioChecked : Icons.radioUnchecked)
                                    .resizable()
                                    .frame(width: 30, height: 50, alignment: .center)
                            }.scaleEffect(CGSize(width: 1.0, height: 0.5))
                                                .alert(isPresented: $showingAlert) {
                                                        let selectedTools = drillingTools.filter { $0.isSelected }
                                                        let selectedToolNames = selectedTools.map { $0.name }.joined(separator: ", ")
                                                        return Alert(
                                                            title: Text("Important Message"),
                                                            message: Text("You selected: \(selectedToolNames)"),
                                                            dismissButton: .default(Text("Got it !"))
                                                        )
                                                }
                        }
                    }
                    
                }
                UIButton(onPress: {
                            print("Continue")
                        }, title: "Continue", disabled: isButtonDisable
                )
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
    DrillingTools()
}
