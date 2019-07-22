//
//  LoginView.swift
//  CodinomeEventos
//
//  Created by Bruna Rafaela Martins Minosso on 22/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit

import Firebase

@objc(LoginView)
class LoginView: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var senhaText: UITextField!
    
    // Do any additional setup after loading the view.
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func LoginButton(_ sender: AnyObject) {
        guard let email = self.emailText.text, let password = self.senhaText.text else {
            
            return
        }
        /*  showSpinner   {
         Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
         guard let strongSelf = self else { return }
         
         strongSelf.hideSpinner {
         if let error = error {
         strongSelf.showMessagePrompt(error.localizedDescription)
         return
         }
         strongSelf.navigationController?.popViewController(animated: true)
         }
         }
         }
         }
         
         */
        
        
        
        
        
        
    }
    
    
}


