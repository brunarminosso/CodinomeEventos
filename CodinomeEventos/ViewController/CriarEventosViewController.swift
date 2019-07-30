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

   
    @IBOutlet weak var nome_evento: UITextField!
    @IBOutlet weak var data_evento: UITextField!
    @IBOutlet weak var tipo_evento: UITextField!
    @IBOutlet weak var orc_evento: UITextField!
    @IBOutlet weak var convidados_eventos: UITextField!
    @IBOutlet weak var botaogravar: UIButton!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let raio = CGFloat(10.0)
        let borderWidth = CGFloat(1.0)
        
        nome_evento.borderStyle = UITextField.BorderStyle.none
        nome_evento.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        nome_evento.layer.cornerRadius = raio
       nome_evento.layer.borderWidth = borderWidth
        
        data_evento.borderStyle = UITextField.BorderStyle.none
        data_evento.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
       data_evento.layer.cornerRadius = raio
        data_evento.layer.borderWidth = borderWidth
        
       tipo_evento.borderStyle = UITextField.BorderStyle.none
       tipo_evento.isSecureTextEntry = true
        tipo_evento.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        tipo_evento.layer.cornerRadius = raio
        tipo_evento.layer.borderWidth = borderWidth
        
        orc_evento.borderStyle = UITextField.BorderStyle.none
       orc_evento.isSecureTextEntry = true
       orc_evento.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        orc_evento.layer.cornerRadius = raio
        orc_evento.layer.borderWidth = borderWidth
        
        convidados_eventos.borderStyle = UITextField.BorderStyle.none
        convidados_eventos.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
       convidados_eventos.layer.cornerRadius = raio
        convidados_eventos.layer.borderWidth = borderWidth
        
        botaogravar.layer.backgroundColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        botaogravar.layer.cornerRadius = raio
    
        
    }
        
        
    @IBAction func botao_gravar(_ sender: Any) {
        self.ref.child("eventos").childByAutoId().setValue(["name": nome_evento?.text, "date": data_evento?.text, "type": tipo_evento?.text, "numberOfGuests": convidados_eventos?.text, "totalBudget": orc_evento?.text])
        
        
    }
        

}
