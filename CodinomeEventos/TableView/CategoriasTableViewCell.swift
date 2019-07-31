//
//  CategoriasTableViewCell.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 30/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit

class CategoriasTableViewCell: UITableViewCell {


    @IBOutlet weak var aba: UIView!
    
    @IBOutlet weak var moldura: UIView!
    
    @IBOutlet weak var nomeCategoria: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        moldura.layer.masksToBounds = true
        moldura.layer.cornerRadius = 10.0
        moldura.layer.borderWidth = 0.5
        moldura.layer.shadowRadius = 4
        moldura.layer.shadowColor = UIColor.black.cgColor
        moldura.layer.shadowOffset = CGSize(width: 0, height: 4)
        moldura.layer.shadowOpacity = 0.23
        moldura.layer.borderColor = UIColor.lightGray.cgColor
        
        nomeCategoria.font = UIFont(name: "Lato-Semibold", size: CGFloat(20))
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
