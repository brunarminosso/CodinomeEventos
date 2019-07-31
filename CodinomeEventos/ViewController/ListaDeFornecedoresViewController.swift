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
    let cep: String
    let endereco: String
    let numero: Double
    let bairro: String
    let cidade: String
    let estado: String
    let telefone_fixo: String
    let celular: String
    let categoria: String
    let nota_avaliacao_media: Double
    let descricao: String
    let avaliacao_qualidade_media: Double
    let avaliacao_pontualidade_media: Double
    let avaliacao_preco_media: Double
//    let avaliacoes: Avaliacoes
    
    enum CondingKeys: String, CodingKey  {
        case nome = "nome"
        case email = "email"
        case cep = "cep"
        case endereco = "endereco"
        case numero = "numero"
        case bairro = "bairro"
        case cidade = "cidade"
        case estado = "estado"
        case telefone_fixo = "telefone_fixo"
        case celular = "celular"
        case categoria = "categoria"
        case nota_avaliacao_media = "nota_avaliacao_media"
        case descricao = "descricao"
        case avaliacao_qualidade_media = "avaliacao_qualidade_media"
        case avaliacao_pontualidade_media = "avaliacao_pontualidade_media"
        case avaliacao_preco_media = "avaliacao_preco_media"
//        case avaliacoes = "avaliacoes"
    }
}

struct Avaliacoes: Decodable {
    let nome_avaliador: String
    let foto_avaliador: String
    let nota: Double
    let texto_aval: String
    
    enum CodingKeys: String, CodingKey {
        case nome_avaliador = "nome_avaliador"
        case foto_avaliador = "foto_avaliador"
        case nota = "nota"
        case texto_aval = "texto_aval"
    }
}

class ListaDeFornecedoresViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return listaFornecedores.count
        if isFiltering(){
            return fornecedorFiltrado.count
        }
        return listaFornecedores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListaFornecedores") as? FornecedoresTableViewCell
        
        let fornecedor: Fornecedor
        
        if isFiltering() {
            fornecedor = fornecedorFiltrado[indexPath.row]
        }
        else {
            fornecedor = listaFornecedores[indexPath.row]
        }
        cell?.ListaFornecedores_nomeFornecedor.text = fornecedor.nome
        cell?.ListaFornecedores_endereco.text = fornecedor.bairro
        cell?.ListaFornecedores_Categoria.text = fornecedor.categoria
        cell?.ListaFornecedores_ImagemFornecedor.image = UIImage(named: "confeitaria")
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fornecedor: Fornecedor
        
        if isFiltering(){
            fornecedor = fornecedorFiltrado[indexPath.row]
        }
        else {
            fornecedor = listaFornecedores[indexPath.row]
        }
        performSegue(withIdentifier: "segueDetalhesFornecedor", sender: fornecedor)
    }
    
    var listaFornecedores = [Fornecedor]()
    var filtro: String = ""
    var fornecedorFiltrado = [Fornecedor]()
//    declaracao da search bar
    let searchController = UISearchController(searchResultsController: nil)
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }

    func filterContentForSeachText (_ searchText: String, scope: String = "All") {
        fornecedorFiltrado = self.listaFornecedores.filter { $0.nome.contains(searchText) }
        tableView.reloadData()
        return
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getdata()
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Busque seus fornecedores"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
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
        
        let jsonUrlString = "https://gist.githubusercontent.com/alineescobar/8aa8fd62a3929f82aae7720edc1900ab/raw/f3c8811ceea9ba5cc4fb429a3685760585e59d31/fornecedores.json"
        
        guard let url = URL(string: jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url){ (data, response, err) in
            
            guard let data = data else {return}
            
            do {
                let dados = try JSONDecoder().decode([Fornecedor].self, from: data)
                
                DispatchQueue.main.async {
                    self.listaFornecedores = dados.filter { $0.categoria == self.filtro }
                    self.tableView.reloadData()
                    print("Numero de linhas:", self.listaFornecedores.count)
                    
                }
                
            } catch let jsonErr{
                print("Error serializating JSON", jsonErr)
            }
            }.resume()
    }
}
extension ListaDeFornecedoresViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSeachText(searchController.searchBar.text!)
    }
}
