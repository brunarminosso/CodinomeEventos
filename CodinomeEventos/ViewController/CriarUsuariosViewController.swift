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
    @IBOutlet weak var botaoCadastrar: UIButton!
    
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        campo_nome.borderStyle = UITextField.BorderStyle.none
        campo_nome.placeholder = "  " + "nome completo"
        campo_nome.text = "  "
        campo_nome.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_nome.layer.cornerRadius = 15.0
        campo_nome.layer.borderWidth = 1.0
        
        campo_email.layer.backgroundColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_email.layer.cornerRadius = 15.0
        
        campo_senha.isSecureTextEntry = true
        campo_senha.layer.backgroundColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_senha.layer.cornerRadius = 15.0
        
        campo_senha_igual.isSecureTextEntry = true
        campo_senha_igual.layer.backgroundColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_senha_igual.layer.cornerRadius = 15.0
        
        campo_pais.layer.backgroundColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_pais.layer.cornerRadius = 15.0
        
        campo_uf.layer.backgroundColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_uf.layer.cornerRadius = 15.0
        
        campo_cidade.layer.backgroundColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_cidade.layer.cornerRadius = 15.0
        
        campo_bairro.layer.backgroundColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_bairro.layer.cornerRadius = 15.0
        
        campo_cep.layer.backgroundColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_cep.layer.cornerRadius = 15.0
        
        campo_rua.layer.backgroundColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_rua.layer.cornerRadius = 15.0
        
        campo_numero.layer.backgroundColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_numero.layer.cornerRadius = 15.0
        
        campo_telefone.layer.backgroundColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_telefone.layer.cornerRadius = 15.0
        
        campo_bloco.layer.backgroundColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_bloco.layer.cornerRadius = 15.0
        
        botaoCadastrar.layer.backgroundColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        botaoCadastrar.layer.cornerRadius = 15.0
        

    }

    
    @IBAction func botao_cadastrar(_ sender: Any) {
        
        
        
        if  campo_senha.text != campo_senha_igual.text {
            
            let alertController = UIAlertController(title: "Error", message: "senhas não coincidem", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            
            self.ref.child("usuarios").childByAutoId().setValue(["nome_completo": campo_nome?.text, "e_mail": campo_email?.text, "pais": campo_pais?.text, "uf": campo_uf?.text, "cidade": campo_cidade?.text, "bairro": campo_bairro?.text, "cep": campo_cep?.text, "nome_da_rua": campo_rua?.text, "bloco": campo_bloco?.text, "numero": campo_numero?.text, "telefone": campo_telefone?.text])
           
            
            Auth.auth().createUser(withEmail: campo_email.text ?? "", password: campo_senha.text ?? "") { authResult, error in
            
        }
            
        self.performSegue(withIdentifier: "cadastrotohome", sender: self)
        
        
        
    }
    
    
    
    
    
    
    
}
}
