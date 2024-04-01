//
//  DrillingTools.swift
//  BHITrainingApp
//
//  Created by Son Giang Hong on 5/3/2024.
//

import Foundation

struct Tool: Identifiable {
    var name: String = ""
    var isSelected: Bool = false
    
    // auto constructor
    
    // implemented properties or function, Identifiable is protocol, qui dinh properties nao la khoa chinh
    var id: String  {
//         return "\(name) - \(isSelected)"
//        return name
        name
    }
}
