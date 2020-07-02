//
//  RegisterController.swift
//  HelpTense
//
//  Created by Pavel Sklyar on 19.03.2020.
//  Copyright © 2020 Pavel Sklyar. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordTwiceField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Скрыть клавиатуру при нажатии  */
        self.hideKeyboardWhenTappedAround()
        
        self.title = "Регистрация"
        
        /* Цвет placeholder'ов */
        emailField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        passwordField.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        passwordTwiceField.attributedPlaceholder = NSAttributedString(string: "Повторите пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        nameField.attributedPlaceholder = NSAttributedString(string: "Имя", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        surnameField.attributedPlaceholder = NSAttributedString(string: "Фамилия", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        /* Делегаты для текстовых полей, чтобы был переход по нажатию на return */
        emailField.delegate = self
        passwordField.delegate = self
        passwordTwiceField.delegate = self
        nameField.delegate = self
        surnameField.delegate = self
        
        /* Добавляем слушателя на события: клавиатура появилась и клавиатура исчезла */
        NotificationCenter.default.addObserver(self, selector: #selector(keyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @IBAction func register(_ sender: UIButton) {
        
    }
}


/* Extension for @OBJC functions */
extension RegisterController {
    
    @objc func keyboard(notification: Notification) {
        
        /* Получаем информацию */
        let userInfo = notification.userInfo!
        
        /* Вычисляем размер клавиатуры */
        let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        /* Проверяем, какой именно Notification к нам пришёл */
        if (notification.name == UIResponder.keyboardWillHideNotification) {
            /* Если клавиатура убрана, то обнуляем все отступы (приводим в исходное положение) */
            scrollView.contentInset = UIEdgeInsets.zero
        }
        else {
            /* Если клавиатура поднята, то изменяем отступ у scrollView до размера клавиатуры */
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
        
        /* Принимаем изменения */
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
}


/* Extension for UITextFieldDelegate */
extension RegisterController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if (textField == emailField) {
            passwordField.becomeFirstResponder()
        }
        else if (textField == passwordField) {
            passwordTwiceField.becomeFirstResponder()
        }
        else if (textField == passwordTwiceField) {
            nameField.becomeFirstResponder()
        }
        else if (textField == nameField) {
            surnameField.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
