//
//  LoginVC.swift
//  UserDefaultsDemo
//
//  Created by Selman ADANİR on 14.08.2022.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var userMailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var rememberBtn: UIButton!
    
    var AgreeIconClick : Bool! = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.CheckAndAdd()
        
    }
    
    
    @IBAction func rememberTapped(_ sender: UIButton) {
        
        if(AgreeIconClick == false) {
            
              if let image = UIImage(named: "check") {
                rememberBtn.setBackgroundImage(image, for: .normal)
              }
            
              AgreeIconClick = true
            
          } else {
            
              if let image = UIImage(named: "un_check") {
                rememberBtn.setBackgroundImage(image, for: .normal)
              }
            
              AgreeIconClick = false
          }

    }

//-------------------------------------------------------------------
    
    @IBAction func saveRememberTapped(_ sender: Any) {
        
        if(AgreeIconClick == true) {
            
        UserDefaults.standard.set(true, forKey: "rememberMe")
        UserDefaults.standard.set(userMailTxt.text ?? "" , forKey: "userMail")
        UserDefaults.standard.set(passwordTxt.text ?? "", forKey: "userPassword")
            
        print("Mail & Password Saved Successfully")
            
        }else{
            
            UserDefaults.standard.set(false, forKey: "rememberMe")

        }
    }
    
//------------------------------------------------------------------

    func CheckAndAdd(){
        if UserDefaults.standard.bool(forKey: "rememberMe") { // default return value equals true
            
            if let image = UIImage(named: "check") {
                rememberBtn.setBackgroundImage(image, for: .normal)
            }
            
            AgreeIconClick = true
            
            // Set values
            self.userMailTxt.text = UserDefaults.standard.string(forKey: "userMail") ?? ""
            self.passwordTxt.text = UserDefaults.standard.string(forKey: "userPassword") ?? ""
            
        }else{
            
            if let image = UIImage(named: "un_check") {
                rememberBtn.setBackgroundImage(image, for: .normal)
            }

            AgreeIconClick = false
        }
    }
}
