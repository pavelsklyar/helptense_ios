//
//  MainController.swift
//  HelpTense
//
//  Created by Pavel Sklyar on 14.03.2020.
//  Copyright © 2020 Pavel Sklyar. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var searchField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor .white]
        self.navigationItem.title = "HelpTense"
        
        searchField.attributedPlaceholder = NSAttributedString(string: "Введите глагол", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
    }
    
    @IBAction func profile(_ sender: Any) {
        let auth = UserDefaults.standard.bool(forKey: "auth")
        
        if (auth == true) {
            let profileController = storyboard?.instantiateViewController(identifier: "ProfileController") as! ProfileController
            
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "На главную", style: .plain, target: nil, action: nil)

            navigationController?.pushViewController(profileController, animated: true)
        }
        else {
            let authController = storyboard?.instantiateViewController(identifier: "AuthController") as! AuthController
            
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "На главную", style: .plain, target: nil, action: nil)
            
            navigationController?.pushViewController(authController, animated: true)
        }
    }
    
    @IBAction func search(_ sender: UITextField) {
        
        let verbController = storyboard?.instantiateViewController(identifier: "VerbController") as! VerbController
        
        if (searchField.text != "") {
            verbController.firstFormFromSearch = searchField.text
            
            /* Кастомная кнопка "назад" */
            navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "На главную", style: .plain, target: nil, action: nil)
            
            navigationController?.pushViewController(verbController, animated: true)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}

/*
    Расширение для UIViewController для скрытия клавиатуры при нажатии где-либо вне текстового поля
    Для работы в viewDidLoad() указать self.hideKeyboardWhenTappedAround()
 */
extension UIViewController {

    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
