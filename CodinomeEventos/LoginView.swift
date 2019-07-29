//
//  LoginView.swift
//  CodinomeEventos
//
//  Created by Bruna Rafaela Martins Minosso on 22/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit

import Firebase

import FBSDKCoreKit
import FBSDKLoginKit
import FacebookCore
import FacebookLogin

@objc(LoginView)
class LoginView: UIViewController {
   

    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var senhaText: UITextField!
    
    @IBOutlet weak var forgotPassword: UIButton!
    
    @IBOutlet weak var criarConta_visual: UIButton!
    
    var email = ""
    var password = ""
    
    let btnFBLogin = FBLoginButton()
    
    @IBOutlet weak var botaoLogin_visual: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        configuracao visual:
        welcomeLabel.font = UIFont(name: "Lato-SemiBold", size: 28)
        welcomeLabel.textColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1)
        
        emailText.borderStyle = UITextField.BorderStyle.none
        emailText.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        emailText.layer.cornerRadius = 10.0
        emailText.layer.borderWidth = 1.0
        emailText.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        
        senhaText.isSecureTextEntry = true
        senhaText.borderStyle = UITextField.BorderStyle.none
        senhaText.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        senhaText.layer.cornerRadius = 10.0
        senhaText.layer.borderWidth = 1.0
        senhaText.layer.borderColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor

        botaoLogin_visual.layer.backgroundColor = UIColor(red: 0.39, green: 0.2, blue: 0.54, alpha: 1).cgColor
        botaoLogin_visual.layer.cornerRadius = 15.0
        
        forgotPassword.tintColor = UIColor(red: 0.16, green: 0.67, blue: 0.89, alpha: 1)
        criarConta_visual.tintColor = UIColor(red: 0.16, green: 0.67, blue: 0.89, alpha: 1)
        
        btnFBLogin.layer.cornerRadius = 10.0
        
//        funcao de login
        let btnFBLogin = FBLoginButton(frame: CGRect(x: 37, y: 640, width: 340, height: 40))
        do {
            func loginButton(_ loginButton: FBLoginButton!, didCompleteWith result: LoginManagerLoginResult!, error: Error!) {
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
                
                
                Auth.auth().signIn(with: credential) { (authResult, error) in
                    if error != nil {
                        
                        self.performSegue(withIdentifier: "loginToHome", sender: self)
                        // ...
                        
                    } else {
                        
//                        print("não foi")
                    }
                    
                    
                    // User is signed in
                    // ...
                }
            }
            
            self.view.addSubview(btnFBLogin)
        }
    }
    
    @IBAction func LoginButton(_ sender: AnyObject) {
        do {

            Auth.auth().signIn(withEmail: emailText.text!, password: senhaText.text!) { (user, error) in
                if error == nil{
                    self.performSegue(withIdentifier: "loginToHome", sender: self)
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

    @IBAction func forgotPass(_ sender: Any) {
        
        let alert = UIAlertController(title: "Esqueceu a senha?", message: "Digite seu e-mail", preferredStyle: .alert)
        
            alert.addTextField { (textfield) in
        }
            alert.addAction(UIAlertAction(title: "Enviar", style: .default, handler: { action in
            Auth.auth().sendPasswordReset(withEmail: alert.textFields?.first?.text ?? "") { error in
                
            }
}
        ))
        self.present(alert, animated: true, completion: nil)

}

}
