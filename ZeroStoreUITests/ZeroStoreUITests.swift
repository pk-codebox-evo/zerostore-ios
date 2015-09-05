//
//  ZeroStoreUITests.swift
//  ZeroStoreUITests
//
//  Created by Kyle Bashour on 9/5/15.
//  Copyright © 2015 Kyle Bashour. All rights reserved.
//

import XCTest
import SSKeychain

class ZeroStoreUITests: XCTestCase {

    let domainName = NSBundle.mainBundle().bundleIdentifier!
    let defaults = NSUserDefaults(suiteName: Constants.Defaults.suiteName)!

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false

        XCUIApplication().launch()

        defaults.removePersistentDomainForName(Constants.Defaults.suiteName)
        SSKeychain.deletePasswordForService(Constants.Keychain.service, account: Constants.Keychain.account)
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func testTutorial() {

        let app = XCUIApplication()

        app.tables.staticTexts["How to Use ZeroStore"].tap()

        let element = app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).element.childrenMatchingType(.Other).element
        element.swipeLeft()
        element.swipeLeft()
        element.swipeLeft()
        app.navigationBars["Tutorial"].buttons["Close"].tap()
    }

    func testPasswordLength() {
        
        let app = XCUIApplication()

        app.tables.staticTexts["Password Length"].tap()
        app.toolbars.buttons["Done"].tap()
    }

    func testSettingMasterPassword() {

        
    }
}
