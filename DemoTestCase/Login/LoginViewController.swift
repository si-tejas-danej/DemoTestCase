//
//  LoginViewController.swift
//  DemoTestCase
//
//  Created by Tejas Danej on 06/08/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    var loginViewModel : LoginViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
       
    }
    
    private func setupViewModel()  {
        if loginViewModel == nil {
            loginViewModel = LoginViewModel(validator: LoginFormValidator(), delegate: self)
        }
    }
    
    @IBAction func loginButtonTap(_ sender: UIButton) {
        
        let loginModel = LoginModel(emaild: txtEmail.text ?? "",
                                    password: txtPassword.text ?? "")
        
        loginViewModel?.loginUser(with: loginModel)
    }
    

}

extension LoginViewController : LoginViewModelDelegate {
    
    
    func successLogin() {
        
        let alertVC = UIAlertController(title: "Success", message: "Successfully login operation completed", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        DispatchQueue.main.async {
            alertVC.view.accessibilityIdentifier = "SuccessAlertMessage"
            self.present(alertVC, animated: true)
        }
    }
    
    func error(with errorMessage: String) {
        
        let alertVC = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        DispatchQueue.main.async {
            alertVC.view.accessibilityIdentifier = "errrorAlertMessage"
            self.present(alertVC, animated: true)
        }
    }

}
