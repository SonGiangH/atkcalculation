//
//  Color+Extensions.swift
//  BHITrainingApp
//
//  Created by Son Giang Hong on 4/3/2024.
//

import Foundation
import SwiftUI

extension Color {
    // viet method init rieng
    init(_ red: Double, _ green: Double, _ blue: Double) {
        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0)
    }
    
    init(hex: UInt, alpha: Double = 1) {
            self.init(
                .sRGB,
                red: Double((hex >> 16) & 0xff) / 255,
                green: Double((hex >> 08) & 0xff) / 255,
                blue: Double((hex >> 00) & 0xff) / 255,
                opacity: alpha
            )
        }
    
    // trong extension them cac static function
    static func doABC() {
        print("do ABC")
    }
}
