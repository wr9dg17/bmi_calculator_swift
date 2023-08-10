//
//  ViewController.swift
//  bmi calculator
//
//  Created by Farid Hamzayev on 05.08.23.
//

import UIKit

class CalculateController: UIViewController {
  var calculatorStore = CalculatorStore()
  
  @IBOutlet weak var heightLabel: UILabel!
  @IBOutlet weak var weightLabel: UILabel!
  @IBOutlet weak var heightSlider: UISlider!
  @IBOutlet weak var weightSlider: UISlider!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToResult" {
      let destinationVC = segue.destination as! ResultController
      destinationVC.bmi = calculatorStore.getBMI()
      destinationVC.advice = calculatorStore.getAdvice()
      destinationVC.color = calculatorStore.getColor()
    }
  }

  @IBAction func heightChanged(_ sender: UISlider) {
    let height = String(format: "%.2f", sender.value)
    heightLabel.text = "\(height)m"
  }
  
  @IBAction func weightChanged(_ sender: UISlider) {
    weightLabel.text = "\(Int(sender.value))kg"
  }
  
  @IBAction func calculatePressed(_ sender: UIButton) {
    let height = heightSlider.value
    let weight = weightSlider.value
    calculatorStore.calculateBMI(height, weight)
    
    self.performSegue(withIdentifier: "goToResult", sender: self)
  }

}

