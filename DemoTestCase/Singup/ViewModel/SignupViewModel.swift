//
//  SignupViewModel.swift
//  DemoTestCase
//
//  Created by Tejas Danej on 05/08/24.
//

import UIKit


protocol  SignupViewModelDelegate : AnyObject {
    
    func successfullySignup()
    
    func errorSignup(error : String)
}

protocol  SignupViewModelProtocol {
    
    func signupUser(with model : SignupModel)
}


class SignupViewModel: SignupViewModelProtocol {
    
    let validator : SingupFormModelValidatorProtocal
    weak var delegate : SignupViewModelDelegate?
    
    init(validator: SingupFormModelValidatorProtocal, delegate: SignupViewModelDelegate ) {
        self.validator = validator
        self.delegate = delegate
    }
    
    func signupUser(with model: SignupModel) {
        
        if !validator.isFirstNameValidator(firstName: model.firstName) {
            delegate?.errorSignup(error: "First Name is not valid")
            return
        }
        
        if !validator.isLastNameValidator(lastName: model.lastName){
            delegate?.errorSignup(error: "Last Name is not valid")
            return
        }
        
        if !validator.isEmailValidator(email:  model.email){
            delegate?.errorSignup(error: "Email is not valid")
            return
        }
        
        if !validator.isPasswordValidator(password: model.password){
            delegate?.errorSignup(error: "Password is not valid")
            return
        }
        
        if !validator.isEqualPasswordValidator(password: model.password, repeatPassword: model.repeatPassword){
            delegate?.errorSignup(error: "Password and repeate password is not valid")
            return
        }
        
        delegate?.successfullySignup()
       
    }

}


