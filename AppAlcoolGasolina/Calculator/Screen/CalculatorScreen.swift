//
//  CalculatorScreen.swift
//  AppAlcoolGasolina
//
//  Created by Yan Alejandro on 20/12/22.
//

import UIKit

protocol CalculateScreenDelegate: AnyObject {
    func tappedCalculateButton()
    func tappedBackButton()
}

class CalculatorScreen: UIView {
    
    private weak var delegate: CalculateScreenDelegate?
    
    public func delegate(delegate: CalculateScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG BLUR")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var logoImageView: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "LOGO menor")
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    
    lazy var ethanolPriceTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        tf.attributedPlaceholder = NSAttributedString(
            string: "Preço do Álcool",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.textColor = .darkGray
        tf.addDoneButtonOnKeyboard()
        return tf
    }()
    
    lazy var gasPriceTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        tf.attributedPlaceholder = NSAttributedString(
            string: "Preço da Gasolina",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        tf.textColor = .darkGray
        tf.addDoneButtonOnKeyboard()
        return tf
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedCalculateButton() {
        delegate?.tappedCalculateButton()
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Botão Back"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedBackButton() {
        delegate?.tappedBackButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundImage)
        addSubview(logoImageView)
        addSubview(ethanolPriceTextField)
        addSubview(gasPriceTextField)
        addSubview(calculateButton)
        addSubview(backButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            ethanolPriceTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 134),
            ethanolPriceTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ethanolPriceTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ethanolPriceTextField.heightAnchor.constraint(equalToConstant: 45),
            
            gasPriceTextField.topAnchor.constraint(equalTo: ethanolPriceTextField.bottomAnchor, constant: 16),
            gasPriceTextField.leadingAnchor.constraint(equalTo: ethanolPriceTextField.leadingAnchor),
            gasPriceTextField.trailingAnchor.constraint(equalTo: ethanolPriceTextField.trailingAnchor),
            gasPriceTextField.heightAnchor.constraint(equalTo: ethanolPriceTextField.heightAnchor),
            
            calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -135),
            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            calculateButton.heightAnchor.constraint(equalToConstant: 44),
            
            
        ])
    }
}
