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
    
    var email = ""
    var password = ""
    let btnFBLogin = FBLoginButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let btnFBLogin = FBLoginButton(frame: CGRect(x: 100, y: 100, width: 100, height: 20))
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
                        
                        print("não foi")
                    }
                    
                    
                    // User is signed in
                    // ...
                }
            }
            
        self.view.addSubview(btnFBLogin)
    }
    }
    
//            Auth.auth().signIn(with: credential) { (authResult, error) in
//                if let error = error {
//                     print("erro")
            
//                    return
//                }
//                self.performSegue(withIdentifier: "loginToHome", sender: self)
//            }
            
//            Auth.auth().signIn(with: credential) { (authResult, error) in
//                if error == nil {
//                    self.performSegue(withIdentifier: "loginToHome", sender: self)
//                }
//                else {
//                }
                // User is signed in
                // ...

    
    
    // Do any additional setup after loading the view.
    
  
   // override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       // self.view.endEditing(true)
        

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
    
        
        
    }
    
    
    

    


    
    
    //func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
   //     <#code#>
    
    
    
    
    


    
    
    
    

    
    
    


/*@IBAction func loginAction(_ sender: Any)
 guard let email = self.emailText.text, let password = self.senhaText.text else {
 
 return
 }
 Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
 guard let strongSelf = self else { return }
 
 if let error = error {
 //strongSelf.showMessagePrompt(error.localizedDescription)
 return
 }
 strongSelf.navigationController?.popViewController(animated: true)
 }
 
*/
