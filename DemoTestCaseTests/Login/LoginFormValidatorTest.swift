//
//  LoginFormValidatorTest.swift
//  DemoTestCaseTests
//
//  Created by Tejas Danej on 06/08/24.
//


@testable import DemoTestCase
import XCTest

class LoginFormValidatorTest: XCTestCase {

    var sut : LoginFormValidator!
    
    
    override  func setUp() {
        
        sut = LoginFormValidator()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    
    func test_LoginFormValidator_whenValidEmailProvied_shouldReturnTrue()   {

        let isEmail = sut.isEmailValidator(email : "tejas.danej0@gmail.com")

       XCTAssertTrue(isEmail)

    }

    func test_LoginFormValidator_whenTooShortEmailProvied_shouldReturnFalse() {

        let isEmail = sut.isEmailValidator(email: "T")

        XCTAssertFalse(isEmail)
    }

    
    
    
    // Password
     func test_LoginFormValidator_whenValidPasswordProvied_shouldReturnTrue()   {
         
         let isPassword = sut.isPasswordValidator(password : "TejasDanej")
         
        XCTAssertTrue(isPassword)
         
     }
     
     func test_LoginFormValidator_whenTooShortPasswordProvied_shouldReturnFalse() {

         let isPassword = sut.isPasswordValidator(password: "T")
         
         XCTAssertFalse(isPassword)
     }
     

     func test_LoginFormValidator_whenTooLongPasswordProvied_ShouldRetrunFalse() {
         
         let isPassword = sut.isPasswordValidator(password: "TejasTejasTest")
         
         XCTAssertFalse(isPassword)
         
     }
    
    
}
