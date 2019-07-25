//
//  RatingPontualidade.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 25/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit

protocol RatingPrecoDelegate: class {
    func ratingPrecoDidChange(_ rating: Int)
}

@IBDesignable class RatingPreco: UIStackView {
    
    
    
    weak var delegate: RatingPrecoDelegate?
    
    private var ratingPrecoButtons = [UIButton]()
    
    var ratingPreco = 0 {
        didSet {
            updateTheButtonSelectionStates()
        }
    }
    
    @IBInspectable var PrecoSize: CGSize = CGSize(width: 50.0, height: 50.0){
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var PrecoCount: Int = 5 {
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
    @objc func ratingPrecoTapped(button: UIButton){
        guard let index = ratingPrecoButtons.firstIndex(of: button) else {
            
            fatalError("The button, \(button), is not in the ratingbuttons array: \(ratingPrecoButtons)")
            
        }
        
        let selectedPrecoRating = index + 1
        if selectedPrecoRating == ratingPreco {
            ratingPreco = 0
        }
        else {
            ratingPreco = selectedPrecoRating
        }
        
        delegate?.ratingPrecoDidChange(ratingPreco)
    }
    // MARK: Private Methods
    
    
    private func setupButtons () {
        //        apaga todos os botoes antigos
        for button in ratingPrecoButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingPrecoButtons.removeAll()
        
        
        for _ in 0..<PrecoCount {
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: PrecoSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: PrecoSize.width).isActive = true
            
            addArrangedSubview(button)
            
            button.addTarget(self, action: #selector(RatingPreco.ratingPrecoTapped(button:)), for: .touchUpInside)
            
            ratingPrecoButtons.append(button)
            
        }
        updateTheButtonSelectionStates()
    }
    private func updateTheButtonSelectionStates () {
        for (index, button) in ratingPrecoButtons.enumerated(){
            button.isSelected = index < ratingPreco
        }
    }
}
