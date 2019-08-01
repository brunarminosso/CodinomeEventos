//
//  EventoCriadoTableViewCell.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 26/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit

class EventoCriadoTableViewCell: UITableViewCell {

    @IBOutlet weak var labelNomeDoEvento_ListaEventos: UILabel!

    @IBOutlet weak var convidados_ListaEventos: UILabel!

    @IBOutlet weak var orc_ListaEventos: UILabel!


    @IBOutlet weak var dia_ListaEventos: UILabel!

    @IBOutlet weak var mes_ListaEventos: UILabel!

    @IBOutlet weak var moldura_evento: UIView!
//
//
//
//
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code


    moldura_evento.layer.masksToBounds = true
    moldura_evento.layer.cornerRadius = 10.0
    moldura_evento.layer.borderWidth = 0
    moldura_evento.layer.shadowRadius = 4
    moldura_evento.layer.shadowColor = UIColor.black.cgColor
    moldura_evento.layer.shadowOffset = CGSize(width: 0, height: 4)
    moldura_evento.layer.shadowOpacity = 0.23
    moldura_evento.layer.borderColor = UIColor.lightGray.cgColor
        
         labelNomeDoEvento_ListaEventos.font = UIFont(name: "Lato-bold", size: CGFloat(25))
          convidados_ListaEventos.font = UIFont(name: "Lato-bold", size: CGFloat(18))
          orc_ListaEventos.font = UIFont(name: "Lato-bold", size: CGFloat(18))
          dia_ListaEventos.font = UIFont(name: "Lato-bold", size: CGFloat(60))
          mes_ListaEventos.font = UIFont(name: "Lato-bold", size: CGFloat(16))
         
        
        
        
    //
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
