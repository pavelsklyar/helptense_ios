//
//  AuthController.swift
//  HelpTense
//
//  Created by Pavel Sklyar on 18.03.2020.
//  Copyright © 2020 Pavel Sklyar. All rights reserved.
//

import UIKit

class AuthController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var authButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        self.title = "Авторизация"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Регистрация", style: .plain, target: self, action: #selector(self.goToRegister))
        
        self.authButton.layer.cornerRadius = 10
        
        emailField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        passwordField.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
    }
    
    @objc func goToRegister() {
        let registerController = storyboard?.instantiateViewController(identifier: "RegisterController") as! RegisterController
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
        navigationController?.pushViewController(registerController, animated: true)
    }
}
