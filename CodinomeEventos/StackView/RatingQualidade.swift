//
//  RatingPontualidade.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 25/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit

protocol RatingQualidadeDelegate: class {
    func ratingQualidadeDidChange(_ rating: Int)
}

@IBDesignable class RatingQualidade: UIStackView {
    
    
    
    weak var delegate: RatingQualidadeDelegate?
    
    private var ratingQualidadeButtons = [UIButton]()
    
    var ratingQualidade = 0 {
        didSet {
            updateTheButtonSelectionStates()
        }
    }
    
    @IBInspectable var QualidadeSize: CGSize = CGSize(width: 50.0, height: 50.0){
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var QualidadeCount: Int = 5 {
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
    @objc func ratingQualidadeTapped(button: UIButton){
            guard let index = ratingQualidadeButtons.firstIndex(of: button) else {
            
            fatalError("The button, \(button), is not in the ratingbuttons array: \(ratingQualidadeButtons)")
            
        }
        
        let selectedQualidadeRating = index + 1
        if selectedQualidadeRating == ratingQualidade {
            ratingQualidade = 0
        }
        else {
            ratingQualidade = selectedQualidadeRating
        }
        
        delegate?.ratingQualidadeDidChange(ratingQualidade)
    }
    // MARK: Private Methods
    
    
    private func setupButtons () {
        //        apaga todos os botoes antigos
        for button in ratingQualidadeButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingQualidadeButtons.removeAll()
        
        let bundle = Bundle(for: type(of: self))
        
        let estrelaCheia = UIImage(named: "estrela_cheia", in: bundle, compatibleWith: self.traitCollection)
        let estrelaVazia = UIImage(named: "estrela_vazia", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<QualidadeCount {
            let button = UIButton()
            button.setImage(estrelaVazia, for: .normal)
            button.setImage(estrelaCheia, for: .selected)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: QualidadeSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: QualidadeSize.width).isActive = true
            
            addArrangedSubview(button)
            
            button.addTarget(self, action: #selector(RatingQualidade.ratingQualidadeTapped(button:)), for: .touchUpInside)
            
            ratingQualidadeButtons.append(button)
            
        }
        updateTheButtonSelectionStates()
    }
    private func updateTheButtonSelectionStates () {
        for (index, button) in ratingQualidadeButtons.enumerated(){
            button.isSelected = index < ratingQualidade
        }
    }
}
