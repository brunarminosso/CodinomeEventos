//
//  PesquisaViewController.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 22/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit



class PesquisaViewController: UIViewController{
    
    var tituloBotao: String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
        
    }
    
    @IBAction func buttonPress(_ sender: UIButton) {
        tituloBotao = sender.titleLabel?.text ?? ""
        performSegue(withIdentifier: "segueLista", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ListaDeFornecedoresViewController
        destination?.filtro = tituloBotao
    }
}
