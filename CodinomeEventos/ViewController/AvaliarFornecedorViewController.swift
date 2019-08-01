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
    
    @IBOutlet weak var nomeFornecedor: UILabel!
    
    @IBOutlet weak var textoAvalie: UILabel!
    
    @IBOutlet weak var textoPontualidaed: UILabel!
    
    @IBOutlet weak var textoQualidade: UILabel!
    
    @IBOutlet weak var textoPreco: UILabel!
    
    @IBOutlet weak var textoComentario: UILabel!
    
    @IBOutlet weak var ratingPontualidadeView: RatingPontualidade!
    
    @IBOutlet weak var ratingQualidadeView: RatingQualidade!
    
    @IBOutlet weak var ratingPrecoView: RatingPreco!

    
    @IBOutlet weak var avaliarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        caixaComentario.backgroundColor = UIColor.gray

        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
        let DadosFornecedor = Dados_fornecedor(context: context)

        ratingPontualidadeView.delegate = self
        ratingQualidadeView.delegate = self
        ratingPrecoView.delegate = self
        
        avaliarButton.tintColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1)
        
        nomeFornecedor.font = UIFont(name: "Lato-Semibold", size: CGFloat(28))
        textoAvalie.font = UIFont(name: "Lato-Semibold", size: CGFloat(14))
        textoPontualidaed.font = UIFont(name: "Lato-Semibold", size: CGFloat(20))
        textoQualidade.font = UIFont(name: "Lato-Semibold", size: CGFloat(20))
        textoPreco.font = UIFont(name: "Lato-Semibold", size: CGFloat(20))

        
    }
    
}
