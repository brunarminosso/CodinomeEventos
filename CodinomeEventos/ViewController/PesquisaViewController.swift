//
//  PesquisaViewController.swift
//  CodinomeEventos
//
//  Created by Aline Osana Escobar on 22/07/19.
//  Copyright © 2019 Bruna Rafaela Martins Minosso. All rights reserved.
//

import UIKit



class PesquisaViewController: UIViewController{
    
    var tituloBotao: String!
    
    @IBOutlet weak var catering: UIButton!
    
    @IBOutlet weak var staff: UIButton!
    
    @IBOutlet weak var location: UIButton!
    
    @IBOutlet weak var photography: UIButton!
    
    @IBOutlet weak var kids: UIButton!
    
    @IBOutlet weak var decoration: UIButton!
    
    @IBOutlet weak var drinks: UIButton!
    
    @IBOutlet weak var music: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let raio = CGFloat(10.0)
        
        catering.layer.cornerRadius = raio
        catering.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        catering.layer.shadowOpacity = 1
        catering.layer.shadowRadius = 10.0
        catering.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        staff.layer.cornerRadius = raio
        staff.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        staff.layer.shadowOpacity = 1
        staff.layer.shadowRadius = 10.0
        staff.layer.shadowOffset = CGSize(width: 0, height: 2)
//        aline.escobar@outlook.com
    }
    
    @IBAction func buttonPress(_ sender: UIButton) {
        tituloBotao = sender.titleLabel?.text ?? ""
        performSegue(withIdentifier: "segueLista", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ListaDeFornecedoresViewController
        destination?.filtro = tituloBotao
    }
}
