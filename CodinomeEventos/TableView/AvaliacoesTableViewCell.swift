//
//  AvaliacoesTableViewCell.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 01/08/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit

class AvaliacoesTableViewCell: UITableViewCell {

    @IBOutlet weak var Aval_imagem: UIImageView!
    
    @IBOutlet weak var Aval_nota: RatingAval!
    
    @IBOutlet weak var Aval_None: UILabel!
    
    @IBOutlet weak var Aval_texto: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
