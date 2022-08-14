//
//  ViewController.swift
//  UserDefaultsDemo
//
//  Created by Selman ADANİR on 11.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
        
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var Resault: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let storedID = UserDefaults.standard.object(forKey: "id") {
            idTextField.text = storedID as? String
        }
        
        if let storedPassword = UserDefaults.standard.object(forKey: "password") {
            passwordTextField.text = storedPassword as? String
        }
            
        
    }

    @IBAction func loginClicked(_ sender: Any) {
        Resault.text = " Welcomte, \(idTextField.text ?? "")"
    }
    
    @IBAction func deldeteClicked(_ sender: Any) {
    }
    
    @IBAction func switchClicked(_ sender: UISwitch) {
        if sender.isOn == true {
            UserDefaults.standard.set(idTextField.text!, forKey: "id")
            UserDefaults.standard.set(passwordTextField.text!, forKey: "password")
        }
    }
}
