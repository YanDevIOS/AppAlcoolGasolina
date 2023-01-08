//
//  Alert.swift
//  AppAlcoolGasolina
//
//  Created by Yan Alejandro on 31/12/22.
//

import UIKit

class Alert {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func showAlertInformation(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okButton)
        
        controller.present(alertController, animated: true)
    }
}
