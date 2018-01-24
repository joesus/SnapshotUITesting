//
//  SnapshotUITestingUITests.swift
//  SnapshotUITestingUITests
//
//  Created by Joe Susnick on 1/23/18.
//  Copyright © 2018 Joe Susnick. All rights reserved.
//

import XCTest

let app = XCUIApplication()

class SnapshotUITestingUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testExample() {

        let app = XCUIApplication()
        app.buttons["Leave World"].tap()

        XCTAssertTrue(app.staticTexts["Hello World"].waitForExistence(timeout: 2))
    }
    
}
