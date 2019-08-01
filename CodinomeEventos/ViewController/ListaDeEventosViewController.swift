//
//  ListaDeEventosViewController.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 29/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit
import Firebase


class ListaDeEventosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ref: DatabaseReference! =  Database.database().reference()
    
    
    @IBOutlet weak var ViewAdd: UIView!
    
    
    @IBOutlet weak var createLabel: UILabel!
    
    @IBOutlet weak var yourLabel: UILabel!
    
   
    
    @IBOutlet weak var guestsLabel: UILabel!
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListaEventos") as? EventoCriadoTableViewCell

        let value =  self.array[indexPath.row] as? [String : Any] ?? [:]
        cell?.labelNomeDoEvento_ListaEventos.text = value["name"] as? String
        cell?.dia_ListaEventos.text = value["dia"] as? String
        cell?.mes_ListaEventos.text = value["mes"] as? String
        cell?.convidados_ListaEventos.text = value["convidados"] as? String
        cell?.orc_ListaEventos.text = value["orçamento"] as? String

        return cell!

    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
   
    var tamanhoArray: Int = 0
    
    var listaEventos: [String: Any] = [:]
    var array: [[String : Any]] = []
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getdata()
        
       ViewAdd.layer.cornerRadius = 10.0
       ViewAdd.layer.masksToBounds = true
        ViewAdd.layer.borderWidth = 0
        
        createLabel.font = UIFont(name: "Lato-bold", size: CGFloat(25))
          yourLabel.font = UIFont(name: "Lato-regular", size: CGFloat(29))
        
        
        
        
        
       
        
        
        
        
        
        // Do any additional setup after loading the view.
        
      

            // ...
     
    }
    
    func getdata() {
        
        
        
        
        ref.child("eventos").observe(.value, with: { (snapshot) in
            if let dicionario = snapshot.value as? [String: Any] {
                self.tamanhoArray = dicionario.count
                self.listaEventos = dicionario
                self.array = self.listaEventos.compactMap{ return $0.value as? [String : Any] }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print("tamanho array:", self.listaEventos.count)
                print(dicionario)
               
            }
            
        })
        
    }
}
