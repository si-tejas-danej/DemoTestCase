//
//  SingupFormModelValidatorProtocal.swift
//  DemoTestCase
//
//  Created by Tejas Danej on 05/08/24.
//

import UIKit

protocol SingupFormModelValidatorProtocal {
    func isFirstNameValidator(firstName : String) -> Bool
    func isLastNameValidator(lastName : String) -> Bool
    func isPasswordValidator(password : String) -> Bool
    func isEmailValidator(email: String) -> Bool
    func isEqualPasswordValidator(password : String, repeatPassword:String) -> Bool
}


public class SingupFormModelValidator :  SingupFormModelValidatorProtocal {
 
    
    func isFirstNameValidator(firstName : String) -> Bool {
        var returnValue = true
        let trimmed =   firstName.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if trimmed.count > 0  {
            returnValue = true
        }
        else {
            returnValue = false
        }
        return returnValue
    }
    
    
    func isLastNameValidator(lastName : String) -> Bool {
        var returnValue = true
        let trimmed =   lastName.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if trimmed.count > 0  {
            returnValue = true
        }
        else {
            returnValue = false
        }
        return returnValue
    }
    
    
    func isPasswordValidator(password : String) -> Bool {
        var returnValue = true
        
        if(password.count <  6  || password.count > 12) {
            returnValue = false
        }
        
        return returnValue
    }
    
    
    func isEmailValidator(email: String) -> Bool  {
        
        var returnValue = true
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        returnValue = regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.count)) != nil
        
        return returnValue
        
    }
    
    func isEqualPasswordValidator(password : String, repeatPassword:String) -> Bool {

        var returnValue = true
        if(password != repeatPassword){
            returnValue = false
        }
        return returnValue
    }
}
