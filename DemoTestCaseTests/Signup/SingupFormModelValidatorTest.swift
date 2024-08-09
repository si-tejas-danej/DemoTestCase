//
//  SingupFormModelValidatorTest.swift
//  DemoTestCaseTests
//
//  Created by Tejas Danej on 05/08/24.
//

import XCTest
@testable import DemoTestCase

final class SingupFormModelValidatorTest: XCTestCase {

    var sut : SingupFormModelValidator!
    
    override  func setUp() {
        sut = SingupFormModelValidator()
    }
    
    override  func tearDown() {
        sut = nil
    }
    
    // First Name
    func test_SignupFormModelValidator_whenValidFirstNameProvied_shouldReturnTrue()   {
        
        let isFirstName = sut.isFirstNameValidator(firstName : "Tejas")
        
       XCTAssertTrue(isFirstName)
        
    }
    
    func test_SignupFormModelValidator_whenTooShortFirstNameProvied_shouldReturnFalse() {

        let isFirstName = sut.isFirstNameValidator(firstName: "T")
        
        XCTAssertFalse(isFirstName)
    }
    

    func test_SigupFormModelValidator_whenTooLongFirstNameProvied_ShouldRetrunFalse() {
        
        let isFirstName = sut.isFirstNameValidator(firstName: "TejasTejasTest")
        
        XCTAssertFalse(isFirstName)
        
    }
    
    
    
    // Last Name
    func test_SignupFormModelValidator_whenValidLastNameProvied_shouldReturnTrue()   {
        
        let isLastName = sut.isLastNameValidator(lastName : "Danej")
        
       XCTAssertTrue(isLastName)
        
    }
    
    func test_SignupFormModelValidator_whenTooShortLastNameProvied_shouldReturnFalse() {

        let isLastName = sut.isLastNameValidator(lastName: "T")
        
        XCTAssertFalse(isLastName)
    }
    

    func test_SigupFormModelValidator_whenTooLongLastNameProvied_ShouldRetrunFalse() {
        
        let isEmail = sut.isLastNameValidator(lastName: "TejasTejasTest")
        
        XCTAssertFalse(isEmail)
        
    }
    
    

   // Password
    func test_SignupFormModelValidator_whenValidPasswordProvied_shouldReturnTrue()   {
        
        let isPassword = sut.isPasswordValidator(password : "Danej")
        
       XCTAssertTrue(isPassword)
        
    }
    
    func test_SignupFormModelValidator_whenTooShortPasswordProvied_shouldReturnFalse() {

        let isPassword = sut.isPasswordValidator(password: "T")
        
        XCTAssertFalse(isPassword)
    }
    

    func test_SigupFormModelValidator_whenTooLongPasswordProvied_ShouldRetrunFalse() {
        
        let isPassword = sut.isPasswordValidator(password: "TejasTejasTest")
        
        XCTAssertFalse(isPassword)
        
    }
    
    func test_SignupFormModelValidator_whenEqualPasswordProvied_ShouldRetrunTrue()   {
     
        let isEqualPassword =  sut.isEqualPasswordValidator(password : "12345678", repeatPassword : "12345678")
        XCTAssertTrue(isEqualPassword)
    }
    
    func test_SignupFormModelValidator_whenNotEqualPasswordProvied_ShouldRetrunTrue()   {
     
        let isEqualPassword =  sut.isEqualPasswordValidator(password : "12345678", repeatPassword : "1234567")
        XCTAssertFalse(isEqualPassword)
    }
    
    

    func test_SignupFormModelValidator_whenValidEmailProvied_shouldReturnTrue()   {

        let isEmail = sut.isEmailValidator(email : "tejas.danej0@gmail.com")

       XCTAssertTrue(isEmail)

    }

    func test_SignupFormModelValidator_whenTooShortEmailProvied_shouldReturnFalse() {

        let isEmail = sut.isEmailValidator(email: "T")

        XCTAssertFalse(isEmail)
    }


    func test_SigupFormModelValidator_whenTooLongEmailProvied_ShouldRetrunFalse() {

        let isEmail = sut.isEmailValidator(email: "TejasTejasTest")

        XCTAssertFalse(isEmail)

    }
}
