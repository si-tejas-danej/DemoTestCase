//
//  LoginFormValidator.swift
//  DemoTestCase
//
//  Created by Tejas Danej on 06/08/24.
//

import UIKit

protocol LoginFormValidatorProtocal  {
    func isEmailValidator(email : String) -> Bool
    func isPasswordValidator(password : String) -> Bool
}



class LoginFormValidator : LoginFormValidatorProtocal {
    func isEmailValidator(email: String) -> Bool {
        var returnValue = true
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        returnValue = regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.count)) != nil
        
        return returnValue
    }
    
    func isPasswordValidator(password: String) -> Bool {
        var returnValue = true
        
        if(password.count <  6  || password.count > 12) {
            returnValue = false
        }
        
        return returnValue
    }
    
    
  
    
}
