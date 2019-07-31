//
//  DetalhesFornecedorViewController.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 23/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit

class DetalhesFornecedorViewController: UIViewController {

    
    @IBOutlet weak var moldura: UIView!
   
    @IBOutlet weak var detalhe_categoria: UILabel!
    
    @IBOutlet weak var evaluate_label: UILabel!
    
    var detalheCategoria: String = ""
    var detalheImagemProdutos: String = ""
    var detalheNomeFornecedor: String = ""
    var detalheDescricao: String = ""
    
    @IBOutlet weak var evaluate_button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detalhe_categoria.font = UIFont(name: "Lato-bold", size: CGFloat(18))
        
        moldura.layer.masksToBounds = true
        moldura.layer.cornerRadius = 10.0
        moldura.layer.shadowRadius = 4
        moldura.layer.shadowColor = UIColor.black.cgColor
        moldura.layer.shadowOffset = CGSize(width: 0, height: 4)
        moldura.layer.shadowOpacity = 0.23

        evaluate_label.font = UIFont(name: "Lato-semibold", size: CGFloat(20))
    
        
        evaluate_button.layer.cornerRadius = 15.0
        evaluate_button.tintColor = UIColor.white
        evaluate_button.backgroundColor = UIColor(red: 0.16, green: 0.67, blue: 0.89, alpha: 1)
        evaluate_button.titleLabel?.font = UIFont(name: "Lato-semibold", size: CGFloat(14))
        // Do any additional setup after loading the view.
    }
    

  
    
}
