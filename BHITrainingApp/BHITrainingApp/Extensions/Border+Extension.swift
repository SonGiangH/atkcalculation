//
//  Border+Extension.swift
//  BHITrainingApp
//
//  Created by Son Giang Hong on 6/3/2024.
//

import Foundation
import SwiftUI

extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}
