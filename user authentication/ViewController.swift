//
//  ViewController.swift
//  user authentication
//
//  Created by Prijay Khadilkar on 2022-06-04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var check = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
      validateForm()
    }
    
    func alert(){
        let alert = UIAlertController(title: "Success", message: "", preferredStyle: .alert)
        let okbtn = UIAlertAction(title: "ok", style: .default){_ in print("pressed")
        }
        alert.addAction(okbtn)
        self.show(alert, sender: nil)
    }
    
    func validateForm(){
        submitButton.isEnabled=false
        
        emailError.isHidden=false
        passwordError.isHidden=false
        
        emailError.text=""
        passwordError.text=""
    }
    
    @IBAction func submit(_ sender: UIButton) {
        validateForm()
        alert()
    }
    
    @IBAction func emailField(_ sender: UITextField) {
    }
    
    @IBAction func passwordField(_ sender: UITextField) {
    }
    
    func invalidPassword(_ value: String)-> String?{
        if !(value == "password1"){
            return "Invalid"
        }
        
        return nil
    }
    
    func checkForValidForm(){
        if passwordError.isHidden && emailError.isHidden {
            submitButton.isEnabled=true
            check = true
        }
        else{
            submitButton.isEnabled=false
        }
    }
    
    @IBAction func emailChange(_ sender: UITextField) {
        if let email = emailTF.text{
            if let errorMessage = invalidEmail(email){
                emailError.text=errorMessage
                emailError.isHidden=false
            }
            else{
                emailError.isHidden=true
            }
        }
        checkForValidForm()
    }
    
    func invalidEmail(_ value: String)-> String? {
        if !(value == "test1@here.com") {
            return "Invalid email"
        }
        return nil
    }
    
    @IBAction func passwordChange(_ sender: UITextField) {
        if let pwd = passwordTF.text {
            if let errorMessage = invalidPassword(pwd){
                passwordError.text = errorMessage
                passwordError.isHidden=false
            }
            else{
                passwordError.isHidden=true
            }
        }
        checkForValidForm()
    }
    
}
