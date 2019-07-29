//
//  CriarUsuariosViewController.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 26/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class CriarUsuariosViewController: UIViewController {
    
    var ref: DatabaseReference! =  Database.database().reference()

    @IBOutlet weak var campo_nome: UITextField!
    @IBOutlet weak var campo_email: UITextField!
    @IBOutlet weak var campo_senha: UITextField!
    @IBOutlet weak var campo_senha_igual: UITextField!
    @IBOutlet weak var campo_pais: UITextField!
    @IBOutlet weak var campo_uf: UITextField!
    @IBOutlet weak var campo_cidade: UITextField!
    @IBOutlet weak var campo_bairro: UITextField!
    @IBOutlet weak var campo_cep: UITextField!
    @IBOutlet weak var campo_rua: UITextField!
    @IBOutlet weak var campo_numero: UITextField!
    @IBOutlet weak var campo_telefone: UITextField!
    @IBOutlet weak var campo_bloco: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
       
       
    
        super.viewDidLoad()
        
        
        campo_nome.borderStyle = UITextField.BorderStyle.none
        campo_nome.layer.cornerRadius = 10.0
        campo_nome.layer.borderWidth = 1.0
        campo_nome.layer.borderColor = UIColor.gray.cgColor
        
//        campo_nome.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 0.22).cgColor
        
        
  // Do any additional setup after loading the view.
    }
    
    @IBAction func botao_cadastrar(_ sender: Any) {
        
        
        
        if  campo_senha.text != campo_senha_igual.text {
            
            let alertController = UIAlertController(title: "Error", message: "senhas não coincidem", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            
            
          self.ref.child("usuarios").child("user_id").setValue(["bloco": campo_bloco.text])
          
            Auth.auth().createUser(withEmail: campo_email.text ?? "", password: campo_senha.text ?? "") { authResult, error in
            
            
        }
        
        
        
        
    }
    
    
    
    
    
    
    
}
}
