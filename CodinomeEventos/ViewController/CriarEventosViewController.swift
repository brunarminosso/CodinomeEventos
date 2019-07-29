//
//  CriarEventosViewController.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 25/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CriarEventosViewController: UIViewController {
    
    var ref: DatabaseReference! = Database.database().reference()

    @IBOutlet weak var campoNomeEvento: UITextField!
    
    @IBOutlet weak var nomeDoEventoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        campoNomeEvento.placeholder = "Nome do seu evento"
        
        
        ref.child("eventos/0/name").observe(.value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let nome_evento = value?["name"] as? String ?? ""
            self.nomeDoEventoLabel.text = nome_evento 
            
        })
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func buttonGravar(_ sender: Any) {
        
        self.ref.child("eventos/0/name").setValue(campoNomeEvento.text as? NSString)
//        print("executou o action do botao")
    }
    
}
