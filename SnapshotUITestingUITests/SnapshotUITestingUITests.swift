//
//  SnapshotUITestingUITests.swift
//  SnapshotUITestingUITests
//
//  Created by Joe Susnick on 1/23/18.
//  Copyright © 2018 Joe Susnick. All rights reserved.
//

import XCTest

let app = XCUIApplication()

class SnapshotUITestingUITests: SnapshotTestCase {

    override func setUp() {
        super.setUp()

        XCUIApplication().launch()

        recordMode = true
    }

    func testExample() {
        verifyView()

        app.buttons["Leave World"].tap()

        XCTAssertTrue(app.staticTexts["Hello World"].waitForExistence(timeout: 2))
    }

}
