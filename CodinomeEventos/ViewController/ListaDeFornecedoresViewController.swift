//
//  ListaDeFornecedoresViewController.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 23/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit

// MARK: - Fornecedore
struct Fornecedores: Codable {
    let nome, email, cep, endereco: String
    let numero: Int
    let bairro: String
    let cidade: String
    let estado: String
    let telefoneFixo, celular: String
    let categoria: String
    let notaAvaliacaoMedia: Double
    let descricao: String
    let avaliacaoQualidadeMedia: Double
    let avaliacaoPontualidadeMedia, avaliacaoPrecoMedia: Int
    let avaliacoes: [Avaliacoe]
    
    enum CodingKeys: String, CodingKey {
        case nome = "nome"
        case email = "email"
        case cep = "cep"
        case endereco = "endereco"
        case numero = "numero"
        case bairro = "bairro"
        case cidade = "cidade"
        case estado = "estado"
        case telefoneFixo = "telefone_fixo"
        case celular = "celular"
        case categoria = "categoria"
        case notaAvaliacaoMedia = "nota_avaliacao_media"
        case descricao = "descricao"
        case avaliacaoQualidadeMedia = "avaliacao_qualidade_media"
        case avaliacaoPontualidadeMedia = "avaliacao_pontualidade_media"
        case avaliacaoPrecoMedia = "avaliacao_preco_media"
        case avaliacoes
    }
}

// MARK: - Avaliacoe
struct Avaliacoe: Codable {
    let nomeAvaliador: String
    let fotoAvaliador: String
    let nota: Int
    let textoAval: String
    
    enum CodingKeys: String, CodingKey {
        case nomeAvaliador = "nome_avaliador"
        case fotoAvaliador = "foto_avaliador"
        case nota = "nota"
        case textoAval = "texto_aval"
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
        
        let fornecedor: Fornecedores
        
        if isFiltering() {
            fornecedor = fornecedorFiltrado[indexPath.row]
        }
        else {
            fornecedor = listaFornecedores[indexPath.row]
        }
        cell?.ListaFornecedores_nomeFornecedor.text = fornecedor.nome
        cell?.ListaFornecedores_endereco.text = fornecedor.bairro
        cell?.ListaFornecedores_Categoria.text = fornecedor.categoria
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fornecedor: Fornecedores
        
        if isFiltering(){
            fornecedor = fornecedorFiltrado[indexPath.row]
        }
        else {
            fornecedor = listaFornecedores[indexPath.row]
        }
        performSegue(withIdentifier: "segueDetalhesFornecedor", sender: fornecedor)
    }
    
    var listaFornecedores = [Fornecedores]()
    var filtro: String = ""
    var fornecedorFiltrado = [Fornecedores]()
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
    
    @IBOutlet weak var categoria_Label: UILabel!
    
    
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
        definesPresentationContext = false
//        format categoria label
        categoria_Label.font = UIFont(name: "Lato-Semibold", size: CGFloat(28))
        categoria_Label.textColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1)
        categoria_Label.text = filtro
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "segueDetalhesFornecedor" {
        if let viewController = segue.destination as? DetalhesFornecedorViewController {
            if let fornecedores = sender as? Fornecedores {
                viewController.detalheNomeFornecedor = fornecedores.nome
                viewController.detalheDescricao = fornecedores.email
                viewController.detalheCategoria = fornecedores.bairro
            }
        }
        }
    }

    func getdata() {
        
        let jsonUrlString = "https://gist.githubusercontent.com/alineescobar/8aa8fd62a3929f82aae7720edc1900ab/raw/9cf8728cf8d699281831d307b92274994031d0bf/fornecedores.json"
        
        guard let url = URL(string: jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url){ (data, response, err) in
            
            guard let data = data else {return}
            
            do {
                let dados = try JSONDecoder().decode([Fornecedores].self, from: data)
                
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
