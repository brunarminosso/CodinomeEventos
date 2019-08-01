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
    
    @IBOutlet weak var moldura: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ListaFornecedores_nomeFornecedor.font = UIFont(name: "Lato-Medium", size: CGFloat(20))
        ListaFornecedores_nomeFornecedor.textColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1)
        
        ListaFornecedores_endereco.font = UIFont(name: "Lato-Medium", size: CGFloat(14))
        ListaFornecedores_endereco.textColor = UIColor.black
        
        ListaFornecedores_Categoria.font = UIFont(name: "Lato-Medium", size: CGFloat(14))
        ListaFornecedores_Categoria.textColor = UIColor.black
        
        moldura.layer.masksToBounds = true
        moldura.layer.cornerRadius = 10.0
//        moldura.layer.borderWidth = 0.5
//        moldura.layer.borderColor = UIColor.lightGray.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
