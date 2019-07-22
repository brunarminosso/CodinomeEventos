//
//  PesquisaViewController.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 22/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit

struct Fornecedor: Codable {
    let nome : String
    let email: String
    let senha: String
    let cep: String
    let endereco: String
    let numero: Int
    let bairro: String
    let cidade: String
    let estado: String
    let telefone_fixo: String
    let celular: String
    
    enum CondingKeys: String, CodingKey  {
        case nome = "nome"
        case email = "email"
        case senha = "senha"
        case cep = "cep"
        case endereco = "endereco"
        case numero = "numero"
        case bairro = "bairro"
        case cidade = "cidade"
        case estado = "estado"
        case telefone_fixo = "telefone_fixo"
        case celular = "celular"
    }
}

class PesquisaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
