//
//  ListaDeEventosViewController.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 29/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit
import Firebase

//struct Eventos: Codable {
//    let name: String
//    let date: String
//    let numberOfGuests: Int
//    let totalBudget: Double
//    let type: String
//
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case date = "date"
//        case numberOfGuests = "numberOfGuests"
//        case totalBudget = "totalBudget"
//        case type = "type"
//    }
//}

class ListaDeEventosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListaEventos") as? EventoCriadoTableViewCell
    
        cell?.labelNomeDoEvento_ListaEventos.text = listaEventos["0"] as! String
        
        return cell!
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tamanhoArray
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference! =  Database.database().reference()
   
    var tamanhoArray: Int = 0
    
    var listaEventos: [String: Any] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
        // Do any additional setup after loading the view.
        
    }
    func getdata() {
        
        ref.child("eventos").observe(.value, with: { (snapshot) in
            if let dicionario = snapshot.value as? [String: Any] {
                self.tamanhoArray = dicionario.count
                self.listaEventos = dicionario
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print("tamanho array:", self.listaEventos.count)
                print(dicionario)
                print(dicionario.randomElement())
                
            }
        })
        
    }
}
