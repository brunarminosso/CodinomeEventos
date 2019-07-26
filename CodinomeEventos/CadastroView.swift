//
//  CadastroView.swift
//  CodinomeEventos
//
//  Created by Bruna Rafaela Martins Minosso on 25/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit
import Firebase


class CadastroView: UIViewController {
    
    
    @IBOutlet weak var NomeField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var senhaField: UITextField!
    @IBOutlet weak var confirmSenha: UITextField!
    @IBOutlet weak var paisField: UITextField!
    @IBOutlet weak var UFField: UITextField!
    @IBOutlet weak var CidadeField: UITextField!
    @IBOutlet weak var bairroField: UITextField!
    @IBOutlet weak var CEPField: UITextField!
    @IBOutlet weak var ruaField: UITextField!
    @IBOutlet weak var numeroField: UITextField!
    @IBOutlet weak var telefoneField: UITextField!
    
    
    class usuário {
    var nome = ""
        var email = ""
        var senha = ""
        var confirma = ""
        
        
    }
    
    
    
    override func viewDidLoad() {
   
        super.viewDidLoad()
    

   
        
        // Do any additional setup after loading the view.

            
            //outlet
    }
        
    @IBAction func cadastroButton(_ sender: Any) {
    
        
                do {
                    
                    Auth.auth().createUser(withEmail: emailField.text!, password: senhaField.text!) { authResult, error in
                        if error == nil{
                            self.performSegue(withIdentifier: "cadastrotohome", sender: self)
                        }
                        else{
                            let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            
                            alertController.addAction(defaultAction)
                            self.present(alertController, animated: true, completion: nil)
                        }
                    }
                    
                }
}
                
                

}
