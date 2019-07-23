//
//  DetalhesFornecedorViewController.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 23/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit

class DetalhesFornecedorViewController: UIViewController {

    
    var detalheCategoria: String = ""
    var detalheImagemProdutos: String = ""
    var detalheNomeFornecedor: String = ""
    var detalheDescricao: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoria_Detalhes.text = detalheCategoria
        imagemProduto_Detalhes.image = UIImage(named: detalheImagemProdutos)
        nomeFornecedor_Detalhes.text = detalheNomeFornecedor
        descricaoFornecedor_Detalhes.text = detalheDescricao
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var categoria_Detalhes: UILabel!
    
    @IBOutlet weak var imagemProduto_Detalhes: UIImageView!
    
    @IBOutlet weak var nomeFornecedor_Detalhes: UILabel!
    
    @IBOutlet weak var descricaoFornecedor_Detalhes: UILabel!
    
}
