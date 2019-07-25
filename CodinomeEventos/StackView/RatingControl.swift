//
//  RatingControl.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 24/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit
//codigo apenas para visualizacao do avaliacao
//falta linkar o valor da avaliacao com a armazenada no banco de dados
@IBDesignable class RatingControl: UIStackView {
    
//MARK: Properties
    
    @IBInspectable var starSize: CGSize = CGSize(width: 40.0, height: 40.0) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    private var ratingButtons = [UIButton]()
    var rating = 0

//MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    @objc func rattingButtonTapped (button: UIButton){
        print("Button pressed!")
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
//MARK: Private Methods
    private func setupButtons () {
//Clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
//        Create the button
        for _ in 0..<starCount {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
//        Setup the button action
//        button.addTarget(self, action: #selector(RatingControl.rattingButtonTapped(button:)), for: .touchUpInside)
//        Add the button to the stack
        addArrangedSubview(button)
//        Add the new button to the rating button array
            
        }
    }
}
