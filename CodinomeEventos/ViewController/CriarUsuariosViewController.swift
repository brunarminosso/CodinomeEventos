//
//  CriarUsuariosViewController.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 26/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CriarUsuariosViewController: UIViewController {
    
    var ref: DatabaseReference! =  Database.database().reference()

    @IBOutlet weak var campo_nome: UITextField!
    @IBOutlet weak var campo_email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        campo_nome.borderStyle = UITextField.BorderStyle.none
        campo_nome.layer.cornerRadius = 10.0
        campo_nome.layer.borderWidth = 1.0
        campo_nome.layer.borderColor = UIColor.gray.cgColor
        
        campo_nome.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 0.22).cgColor
        
  // Do any additional setup after loading the view.
    }
    
}
