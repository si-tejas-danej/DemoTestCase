//
//  LoginViewModel.swift
//  DemoTestCase
//
//  Created by Tejas Danej on 06/08/24.
//

import UIKit

protocol LoginViewModelProtocol {
    
    func loginUser(with model : LoginModel)
}


protocol LoginViewModelDelegate : AnyObject {
    
    func successLogin()
    func error(with errorMessage : String)
}

class LoginViewModel: LoginViewModelProtocol {
    
    var validator : LoginFormValidatorProtocal
    weak var delegate : LoginViewModelDelegate?
    
    init(validator: LoginFormValidatorProtocal, delegate : LoginViewModelDelegate) {
        self.validator = validator
        self.delegate = delegate
    }
    
    func loginUser(with model: LoginModel) {
        if !self.validator.isEmailValidator(email: model.emaild) {
            delegate?.error(with: "Email is invalid")
            return
        }
        
        if !self.validator.isPasswordValidator(password: model.password) {
            delegate?.error(with: "Password is invalid")
            return
        }
        
        delegate?.successLogin()
        
    }
    
    
    
}
