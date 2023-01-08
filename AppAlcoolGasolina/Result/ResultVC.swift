//
//  ResultVC.swift
//  AppAlcoolGasolina
//
//  Created by Yan Alejandro on 01/01/23.
//

import UIKit

enum BestFuel: String {
    case gas = "Gasolina"
    case ethanol = "Álcool"
}

class ResultVC: UIViewController {
    
    var screen: ResultScreen?
    let bestFuel: BestFuel?
    
    init(bestFuel: BestFuel) {
        self.bestFuel = bestFuel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = ResultScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.resultLabel.text = bestFuel?.rawValue
        screen?.delegate(delegate: self)
    }
}


extension ResultVC: ResultScreenDelegate {
    func tappedCalculateButton() {
        navigationController?.popViewController(animated: true)
    }
}
