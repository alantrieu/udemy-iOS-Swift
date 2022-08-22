//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Alan Trieu on 22/8/2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmiValue: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let tmpBMI = weight / (height * height)
        if (tmpBMI < 18.5) {
            bmiValue = BMI(value: tmpBMI, advice: "Eat more pies!", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        } else if (tmpBMI < 24.9) {
            bmiValue = BMI(value: tmpBMI, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        } else {
            bmiValue = BMI(value: tmpBMI, advice: "Eat less pies!", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        }
    }
    
    func getBMIValue() -> String {
        let bmiFormatted = String(format: "%.f", bmiValue?.value ?? 0.0)
        return bmiFormatted
    }
    
    func getAdvice() -> String {
        return bmiValue?.advice ?? "Error!"
    }
    
    func getColor() -> UIColor {
        return bmiValue?.color ?? #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
    }
}
