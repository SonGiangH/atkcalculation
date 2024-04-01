//
//  Calculator.swift
//  BHITrainingApp
//
//  Created by Son Giang Hong on 6/3/2024.
//

import Foundation
import SwiftUI

class Direction: ObservableObject {
    // shared state share giua nhieu View, man hinh
    @Published var dlgBase = 65             //  initial value of E4
    @Published var sfBase = 10000.000       //  initial value of E6
    @Published var sdBase = 3450.00         //  initial value of E7
    @Published var actIncBase = 900.00      //  initial value of J4
    @Published var bfBase = 10000.00        //  initial value of E10
    @Published var wfBase = 20000.00        //  initial value of E11
    @Published var tiBase = 1280.00         //  initial value of E12

    var step : Double {
        return 10000.000 / 31.000
    }
    
    var doglegGradient: Double {
        return Double(dlgBase) / 1000
    }
    
    var steerForce: Double {
        return Double(sfBase) / 100
    }
    
    var steerDirection: Double {
        return Double(sdBase / 10)
    }
    
    var steerDLS: Double {
        return Double(doglegGradient * steerForce)
    }
    
    var buildRate: Double {
        return Double(doglegGradient * cos(DegreeToRadians(steerDirection)) * steerForce)
    }
    
    var actualHoleInc: Double {
        return Double(actIncBase / 10)
    }
    
    var walkRate: Double {
        return Double(steerForce * sin(DegreeToRadians(steerDirection)) * doglegGradient / sin(DegreeToRadians(actualHoleInc)))
    }
    
    var buildForce: Double {
        return Double(bfBase) / 100
    }
    
    var walkForce: Double {
        return Double(wfBase / 100.00 - 100.00)
    }
    
    var targetInclination: Double {
        return Double(tiBase / 10)
    }
    
    // resultant Steer Force and Direction for Walkforce Calculation
    var resultantSteerForce: Double {
        let sqrtValue = sqrt(pow(walkForce, 2) + pow(buildForce, 2))
            return sqrtValue > 100 ? 100 : sqrtValue
    }
    // func format 1 decimal
    func formatDecimal(_ number: Double) -> Double {
        return ((number * 10).rounded() / 10)
    }
    
    var resultantDirection: Double {
                
        if (actualHoleInc <= targetInclination) {
            if (walkForce > 0) {
//                print(formatDecimal(ConvertToDegrees(atan2(buildForce,walkForce))))
                
                return formatDecimal(ConvertToDegrees(atan2(walkForce,buildForce)))
            } else {
                
//                print(formatDecimal(ConvertToDegrees(atan2(buildForce, walkForce)) + 360.00))
                
                return formatDecimal(ConvertToDegrees(atan2(walkForce, buildForce)) + 360.00)
            }
        } else {
            
//            print(formatDecimal(ConvertToDegrees(atan2(walkForce,buildForce)) + 90.00))
            
            return formatDecimal(ConvertToDegrees(atan2(buildForce,walkForce)) + 90.00)
        }
    }
    
    var holdModeDLS : Double {
        return Double(doglegGradient * resultantSteerForce)
    }
    
    var holdModeBuildRate: Double {
        return Double(resultantSteerForce * cos(DegreeToRadians(abs(resultantDirection))) * doglegGradient)
    }
    
    var holdModeWalkRate: Double {
        return Double(resultantSteerForce * sin(DegreeToRadians(resultantDirection)) * doglegGradient / sin(DegreeToRadians(actualHoleInc)))
    }
    
    // Spin Up - Down DLS
    func increaseDlBase() {
        dlgBase += 1
    }
    
    func decreaseDlBase() {
        dlgBase = (dlgBase - 1) <= 0 ? 0 : dlgBase - 1
    }
    
    // Spin Up - Down Steer Force
    func increaseSteerForce() {
        sfBase = sfBase < 10000.000 ? sfBase + step : sfBase
        
    }
    
    func decreaseSteerForce() {
        sfBase = sfBase > 0.000 ? sfBase - step : sfBase
        

    }
    
    // Steer Direction Big
    func increaseSDBig() {
        sdBase = (sdBase + 150.00) > 3600.00 ? abs(sdBase - 3450.00) : sdBase + 150.00
        
        
    }
    
    func decreaseSDBig() {
        sdBase = (sdBase - 150.00) < 0.00 ? sdBase + 3450.00 : sdBase - 150.00
        
        
    }
    
    // Steer Direction Small
    func increaseSDSmall() {
        sdBase = (sdBase + 15.00) > 3600.00 ? abs(sdBase - 3585.00) : sdBase + 15.00
        
        
    }
    
    func decreaseSDSmall() {
        sdBase = (sdBase - 15.00) < 0.00 ? sdBase + 3585.00 : sdBase - 15.00
        
        
    }
    
    // Actual Inclination Small
    func increaseIncSmall() {
        actIncBase = (actIncBase + 1.00) >= 1400.00 ? 1400.00 : actIncBase + 1.00
        
    }
    
    func decreaseIncSmall() {
        actIncBase = (actIncBase - 1.00) <= 0.00 ? 0.00 : actIncBase - 1.00
        
    }
    
    // Actual Inclination Big
    func increaseIncBig() {
        actIncBase = (actIncBase + 10.00) >= 1400.00 ? 1400.00 : actIncBase + 10.00
        
    }
    
    func decreaseIncBig() {
        actIncBase = (actIncBase - 10.00) <= 0.00 ? 0.00 : actIncBase - 10.00
        
    }
    
    // Build Force controller
    func increaseBuildForce() {
        bfBase = (bfBase + 10000.00 / 31.00) > 10000.00 ? 10000.00 : bfBase + (10000.00 / 31.00)
        
        
    }
    
    func decreaseBuildForce() {
        bfBase = (bfBase - 10000.00 / 31.00) < 0.00 ? 0.00 : bfBase - (10000.00 / 31.00)
        
        
    }
    
    // Walk Force Controller
    func increaseWalkForce() {
        wfBase = (wfBase + 20000.00 / 62.00) > 20000.00 ? 20000.00 : wfBase + 20000.00 / 62.00
        
       
    }
    
    func decreaseWalkForce() {
        wfBase = (wfBase - 20000.00 / 62.00) < 1.47792889038101E-12 ? 1.47792889038101E-12 : (wfBase - 20000.00 / 62.00)
        
        
    }
    
    // Target Inclination Controller - Small
    func increaseTIsmall() {
        tiBase = (tiBase + 1.00) > 1280.00 ? 1280.00 : tiBase + 1.00
        
    }
    
    func decreaseTIsmall() {
        tiBase = (tiBase - 1.00) < 0.00 ? 0.00 : tiBase - 1.00
        
    }
    
    // Target Inclination Controller - Big
    func increaseTIBig() {
        tiBase = (tiBase + 50.00) > 1280.00 ? 1280.00 : tiBase + 50.00
        
    }
    
    func decreaseTIBig() {
        tiBase = (tiBase - 50.00) < 0.00 ? 0.00 : tiBase - 50.00
        
    }
}

