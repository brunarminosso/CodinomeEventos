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
        let raio = CGFloat(10.0)
        let borderWidth = CGFloat(1.0)
        
        campo_nome.borderStyle = UITextField.BorderStyle.none
        campo_nome.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_nome.layer.cornerRadius = raio
        campo_nome.layer.borderWidth = borderWidth
        
        campo_email.borderStyle = UITextField.BorderStyle.none
        campo_email.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_email.layer.cornerRadius = raio
        campo_email.layer.borderWidth = borderWidth
        
        campo_senha.borderStyle = UITextField.BorderStyle.none
        campo_senha.isSecureTextEntry = true
        campo_senha.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_senha.layer.cornerRadius = raio
        campo_senha.layer.borderWidth = borderWidth
        
        campo_senha_igual.borderStyle = UITextField.BorderStyle.none
        campo_senha_igual.isSecureTextEntry = true
        campo_senha_igual.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_senha_igual.layer.cornerRadius = raio
        campo_senha_igual.layer.borderWidth = borderWidth
        
        campo_pais.borderStyle = UITextField.BorderStyle.none
        campo_pais.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_pais.layer.cornerRadius = raio
        campo_pais.layer.borderWidth = borderWidth
        
        campo_uf.borderStyle = UITextField.BorderStyle.none
        campo_uf.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_uf.layer.cornerRadius = raio
        campo_uf.layer.borderWidth = borderWidth
        
        
        campo_cidade.borderStyle = UITextField.BorderStyle.none
        campo_cidade.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_cidade.layer.cornerRadius = raio
        campo_cidade.layer.borderWidth = borderWidth
        
        campo_bairro.borderStyle = UITextField.BorderStyle.none
        campo_bairro.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_bairro.layer.cornerRadius = raio
        campo_bairro.layer.borderWidth = borderWidth
        
        campo_cep.borderStyle = UITextField.BorderStyle.none
        campo_cep.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_cep.layer.cornerRadius = raio
        campo_cep.layer.borderWidth = borderWidth
        
        campo_rua.borderStyle = UITextField.BorderStyle.none
        campo_rua.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_rua.layer.cornerRadius = raio
        campo_rua.layer.borderWidth = borderWidth
        
        campo_numero.borderStyle = UITextField.BorderStyle.none
        campo_numero.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_numero.layer.cornerRadius = raio
        campo_numero.layer.borderWidth = borderWidth
        
        campo_telefone.borderStyle = UITextField.BorderStyle.none
        campo_telefone.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_telefone.layer.cornerRadius = raio
        campo_telefone.layer.borderWidth = borderWidth
        
        campo_bloco.borderStyle = UITextField.BorderStyle.none
        campo_bloco.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        campo_bloco.layer.cornerRadius = raio
        campo_bloco.layer.borderWidth = borderWidth
        
        botaoCadastrar.layer.backgroundColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        botaoCadastrar.layer.cornerRadius = raio
        

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
