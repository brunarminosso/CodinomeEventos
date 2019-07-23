//
//  ListaDeFornecedoresViewController.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 23/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit
struct Fornecedor: Codable {
    let nome : String
    let email: String
    let senha: String
    let cep: String
    let endereco: String
    let numero: Double
    let bairro: String
    let cidade: String
    let estado: String
    let telefone_fixo: String
    let celular: String
//    let categoria: String
//    let nota_avaliacao_media: Double
//    let descricao: String
//    let avaliacao_texto1: String
//    let avaliacao_qualidade_media: Double
//    let avaliacao_pontualidade_media: Double
//    let avaliacao_preco_media: Double
    
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
//        case categoria = "categoria"
//        case nota_avaliacao_media = "nota_avaliacao_media"
//        case descricao = "descricao"
//        case avaliacao_texto1 = "avaliacao_texto1"
//        case avaliacao_qualidade_media = "avaliacao_qualidade_media"
//        case avaliacao_pontualidade_media = "avaliacao_pontualidade_media"
//        case avaliacao_preco_media = "avaliacao_preco_media"
    }
}

class ListaDeFornecedoresViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaFornecedores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListaFornecedores") as? FornecedoresTableViewCell

        cell?.ListaFornecedores_nomeFornecedor.text = listaFornecedores[indexPath.row].nome
        cell?.ListaFornecedores_endereco.text = listaFornecedores[indexPath.row].bairro
        cell?.ListaFornecedores_Categoria.text = listaFornecedores[indexPath.row].senha
        cell?.ListaFornecedores_ImagemFornecedor.image = UIImage(named: "confeitaria")
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueDetalhesFornecedor", sender: listaFornecedores[indexPath.row])
    }
    
    var listaFornecedores = [Fornecedor]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getdata()
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "segueDetalhesFornecedor" {
        if let viewController = segue.destination as? DetalhesFornecedorViewController {
            if let fornecedores = sender as? Fornecedor {
                viewController.detalheNomeFornecedor = fornecedores.nome
                viewController.detalheDescricao = fornecedores.email
                viewController.detalheCategoria = fornecedores.bairro
            }
        }
        }
    }
    
    func getdata() {
        
        let jsonUrlString = "https://gist.githubusercontent.com/alineescobar/8aa8fd62a3929f82aae7720edc1900ab/raw/076ea119588664ba1cdf4ed7cf047082cf3905a4/fornecedores.json"
        
        guard let url = URL(string: jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url){ (data, response, err) in
            
            guard let data = data else {return}
            
            do {
                let dados = try JSONDecoder().decode([Fornecedor].self, from: data)
                
                DispatchQueue.main.async {
                    self.listaFornecedores = dados
                    self.tableView.reloadData()
                    print("Numero de linhas:", self.listaFornecedores.count)
                }
                
            } catch let jsonErr{
                print("Error serializating JSON", jsonErr)
            }
            }.resume()
    }
}