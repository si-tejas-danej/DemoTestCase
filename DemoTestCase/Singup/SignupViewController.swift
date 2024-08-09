//
//  SignupViewController.swift
//  DemoTestCase
//
//  Created by Tejas Danej on 05/08/24.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var txtRepeatPassword: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtLN: UITextField!
    @IBOutlet weak var txtFN: UITextField!
    
    var sigupViewModel : SignupViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    private func setupViewModel() {
        if sigupViewModel == nil {
            sigupViewModel = SignupViewModel(validator: SingupFormModelValidator(), delegate: self)
        }
    }

    @IBAction func singupButtonTap(_ sender: UIButton) {
        let signupModel = SignupModel(firstName: txtFN.text ?? "" ,
                                      lastName: txtLN.text ?? "",
                                      email: txtEmail.text ?? "",
                                      password: txtPassword.text ?? "" ,
                                      repeatPassword: txtRepeatPassword.text ?? "")
        
        sigupViewModel?.signupUser(with: signupModel)
    }
    
    @IBAction func loginButtonTap(_ sender: UIButton) {
        guard   let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            return
        }
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
}

extension SignupViewController : SignupViewModelDelegate {
    
    func successfullySignup() {
        let alertVC = UIAlertController(title: "Success", message: "Successfully signup operation completed", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        DispatchQueue.main.async {
            alertVC.view.accessibilityIdentifier = "SuccessAlertMessage"
            self.present(alertVC, animated: true)
        }
    }
    
    func errorSignup(error: String) {
        
        let alertVC = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        
        DispatchQueue.main.async {
            alertVC.view.accessibilityIdentifier = "errrorAlertMessage"
            self.present(alertVC, animated: true)
        }
        
    }
    
    
}
