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
    @IBOutlet weak var dia_evento: UITextField!
    @IBOutlet weak var tipo_evento: UITextField!
    @IBOutlet weak var orc_evento: UITextField!
    @IBOutlet weak var convidados_eventos: UITextField!
    @IBOutlet weak var botaogravar: UIButton!
    
    @IBOutlet weak var mes_evento: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let raio = CGFloat(10.0)
        let borderWidth = CGFloat(1.0)
        
        nome_evento.borderStyle = UITextField.BorderStyle.none
        nome_evento.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        nome_evento.layer.cornerRadius = raio
       nome_evento.layer.borderWidth = borderWidth
        
        dia_evento.borderStyle = UITextField.BorderStyle.none
        dia_evento.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
       dia_evento.layer.cornerRadius = raio
        dia_evento.layer.borderWidth = borderWidth
        
        mes_evento.borderStyle = UITextField.BorderStyle.none
        mes_evento.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        mes_evento.layer.cornerRadius = raio
        mes_evento.layer.borderWidth = borderWidth
        
       tipo_evento.borderStyle = UITextField.BorderStyle.none
        tipo_evento.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        tipo_evento.layer.cornerRadius = raio
        tipo_evento.layer.borderWidth = borderWidth
        
        orc_evento.borderStyle = UITextField.BorderStyle.none
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
        self.ref.child("eventos").childByAutoId().setValue(["name": nome_evento?.text, "dia": dia_evento?.text, "type": tipo_evento?.text, "convidados": convidados_eventos?.text, "orçamento": orc_evento?.text, "mes": mes_evento?.text])
        
        
    }
        

}
