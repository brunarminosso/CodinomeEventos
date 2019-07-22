//
//  FornecedoresTableViewCell.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 22/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit

class FornecedoresTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ListaFornecedores_nomeFornecedor: UILabel!
    
    @IBOutlet weak var ListaFornecedores_endereco: UILabel!
    
    @IBOutlet weak var ListaFornecedores_Categoria: UILabel!
    
    @IBOutlet weak var ListaFornecedores_ImagemFornecedor: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
