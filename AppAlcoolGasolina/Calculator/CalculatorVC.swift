//
//  CalculatorVC.swift
//  AppAlcoolGasolina
//
//  Created by Yan Alejandro on 20/12/22.
//

import UIKit

class CalculatorVC: UIViewController{
    
    var screen: CalculatorScreen?
    var alert: Alert?
    
    override func loadView() {
        screen = CalculatorScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        alert = Alert(controller: self)
        screen?.delegate(delegate: self)
    }

    func validateTextFields() -> Bool {
        guard let ethanol = screen?.ethanolPriceTextField.text else {return false}
        guard let gas = screen?.gasPriceTextField.text else {return false}
        
        if ethanol.isEmpty && gas.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe os valores de álcool e gasolina")
            return false
        } else if ethanol.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe o valor do álcool")
            return false
        } else if gas.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe o valor da gasolina")
            return false
        }
            
        return true
    }
}

extension CalculatorVC: CalculateScreenDelegate {
    func tappedCalculateButton() {
        
        if validateTextFields() {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal

            let ethanol: Double = (formatter.number(from: screen?.ethanolPriceTextField.text ?? "0.0") as? Double) ?? 0.0
            let gas: Double = (formatter.number(from: screen?.gasPriceTextField.text ?? "0.0") as? Double) ?? 0.0

            var vc: ResultVC?
            if ethanol / gas > 0.7 {
                print("Melhor utilizar Gasolina!")
                vc = ResultVC(bestFuel: .gas)
            } else {
                print("Melhor utilizar Álcool!")
                vc = ResultVC(bestFuel: .ethanol)

            }
            navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
            clearViewData()
        }
        
        func clearViewData() {
            screen?.ethanolPriceTextField.text = ""
            screen?.gasPriceTextField.text = ""
        }
        
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
