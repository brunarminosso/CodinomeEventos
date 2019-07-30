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
        moldura.layer.borderWidth = 0
        moldura.layer.shadowRadius = 10
        moldura.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        moldura.layer.shadowOffset = CGSize(width: 0, height: 4)
        moldura.layer.shadowOpacity = 1
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
