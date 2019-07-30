//
//  PesquisaViewController.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 22/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit



class PesquisaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let categorias = ["Catering", "Staff", "Location", "Photography", "Kid's party", "Decoration", "Drinks", "Music"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categorias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CelulaCategoria") as? CategoriasTableViewCell
        
        if indexPath.row % 2 != 0 {
            cell?.aba.backgroundColor = UIColor(red: 0.16, green: 0.67, blue: 0.89, alpha: 1)
            cell?.nomeCategoria.textColor = UIColor(red: 0.16, green: 0.67, blue: 0.89, alpha: 1)
        }
        else {
            cell?.aba.backgroundColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1)
            cell?.nomeCategoria.textColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1)
        }
        
        cell?.nomeCategoria.text = categorias[indexPath.row]
        
        return cell!
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
    
    
    var tituloBotao: String!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    
    }
    
//    @IBAction func buttonPress(_ sender: UIButton) {
//        tituloBotao = sender.titleLabel?.text ?? ""
//        performSegue(withIdentifier: "segueLista", sender: nil)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destination = segue.destination as? ListaDeFornecedoresViewController
//        destination?.filtro = tituloBotao
//    }
}

