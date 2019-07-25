//
//  RatingPontualidade.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 25/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit

protocol RatingPontualidadeDelegate: class {
    func ratingPontualidadeDidChange(_ rating: Int)
}

@IBDesignable class RatingPontualidade: UIStackView {


    
    weak var delegate: RatingPontualidadeDelegate?
    
    private var ratingPontualidadeButtons = [UIButton]()

    var ratingPontualidade = 0 {
        didSet {
            updateTheButtonSelectionStates()
        }
    }
    
    @IBInspectable var pontualidadeSize: CGSize = CGSize(width: 50.0, height: 50.0){
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var pontulidadeCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
       super.init(coder: coder)
        setupButtons()
    }
    //    MARK: Button action
    @objc func ratingPontualidadeTapped(button: UIButton){
        guard let index = ratingPontualidadeButtons.firstIndex(of: button) else {
            
            fatalError("The button, \(button), is not in the ratingbuttons array: \(ratingPontualidadeButtons)")
            
        }
        
        let selectedPontualidadeRating = index + 1
        if selectedPontualidadeRating == ratingPontualidade {
            ratingPontualidade = 0
        }
        else {
            ratingPontualidade = selectedPontualidadeRating
        }
        
        delegate?.ratingPontualidadeDidChange(ratingPontualidade)
    }
    // MARK: Private Methods
    
    
    private func setupButtons () {
//        apaga todos os botoes antigos
        for button in ratingPontualidadeButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingPontualidadeButtons.removeAll()
        
        
        for _ in 0..<pontulidadeCount {
            let button = UIButton()
            button.backgroundColor = UIColor.yellow
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: pontualidadeSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: pontualidadeSize.width).isActive = true
            
            addArrangedSubview(button)
            
            button.addTarget(self, action: #selector(RatingPontualidade.ratingPontualidadeTapped(button:)), for: .touchUpInside)
            
            ratingPontualidadeButtons.append(button)
            
        }
        updateTheButtonSelectionStates()
    }
    private func updateTheButtonSelectionStates () {
        for (index, button) in ratingPontualidadeButtons.enumerated(){
            button.isSelected = index < ratingPontualidade
        }
    }
}
