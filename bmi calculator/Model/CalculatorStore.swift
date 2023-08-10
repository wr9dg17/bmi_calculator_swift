//
//  CalculatorStore.swift
//  bmi calculator
//
//  Created by Farid Hamzayev on 07.08.23.
//

import UIKit

struct CalculatorStore {
  var bmi: BMI?
  
  func getBMI() -> String {
    return String(format: "%.1f", bmi?.value ?? 0.0)
  }
  
  func getAdvice() -> String {
    return bmi?.advice ?? "Something went wrong";
  }
  
  func getColor() -> UIColor {
    return bmi?.color ?? .red;
  }
  
  mutating func calculateBMI(_ height: Float, _ weight: Float) {
    let calculatedBMI = weight / pow(height, 2)
    
    if calculatedBMI < 18.5 {
      bmi = BMI(value: calculatedBMI, advice: "Eat more poes", color: .systemTeal)
    } else if calculatedBMI < 24.9 {
      bmi = BMI(value: calculatedBMI, advice: "Fit as a fiddle", color: .systemGreen)
    } else {
      bmi = BMI(value: calculatedBMI, advice: "Eat less pies", color: .systemPurple)
    }
  }
}
