//
//  AvaliarFornecedorViewController.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 25/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit

class AvaliarFornecedorViewController: UIViewController, RatingPontualidadeDelegate, RatingQualidadeDelegate, RatingPrecoDelegate {
    
    
    func ratingPontualidadeDidChange(_ ratingPontualidade: Int) {
        print("Rating pontualidade: \(ratingPontualidade)")
    }
    
    func ratingQualidadeDidChange(_ ratingQualidade: Int) {
        print("Rating Qualidade: \(ratingQualidade)")
    }
    
    func ratingPrecoDidChange(_ ratingPreco: Int) {
        print("Rating preco: \(ratingPreco)")
        
    }

    @IBOutlet weak var ratingPontualidadeView: RatingPontualidade!
    
    @IBOutlet weak var ratingQualidadeView: RatingQualidade!
    
    @IBOutlet weak var ratingPrecoView: RatingPreco!
    
    @IBOutlet weak var caixaComentario: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        caixaComentario.backgroundColor = UIColor.gray
        // Do any additional setup after loading the view.
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }

        let DadosFornecedor = Dados_fornecedor(context: context)
        
        ratingPontualidadeView.delegate = self
        ratingQualidadeView.delegate = self
        ratingPrecoView.delegate = self
        
    }
    
}
