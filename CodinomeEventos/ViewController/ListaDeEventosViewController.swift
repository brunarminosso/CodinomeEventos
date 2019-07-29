//
//  ListaDeEventosViewController.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 29/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit

struct Eventos: Codable {
    let date: String
    let name: String
    let numberOfGuests: Int
    let totalBudget: Double
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case name = "name"
        case numberOfGuests = "numberOfGuests"
        case totalBudget = "totalBudget"
        case type = "type"
    }
}

class ListaDeEventosViewController: UIViewController {
    var listaEventos = [Eventos]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
        // Do any additional setup after loading the view.
        
    }
    func getdata() {
        
        let jsonUrlString = "https://eventei-fa316.firebaseio.com/eventos/0/"
        
        print("linha 41")
        guard let url = URL(string: jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url){ (data, response, err) in
            
            guard let data = data else {return}
            
            do {
                let dados = try JSONDecoder().decode([Eventos].self, from: data)
                
                DispatchQueue.main.async {
                    self.listaEventos = dados
                    self.tableView.reloadData()
                    print("Numero de rows: ",self.listaEventos.count)
                }
                
            } catch let jsonErr{
                print("Error serializating JSON", jsonErr)
            }
            }.resume()
    }

}
