//
//  VirtualCVUITests.swift
//  CodeLatheDemoUITests
//
//  Created by Josh Freed on 1/25/21.
//

import XCTest

class VirtualCVUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments.append("UI_TESTING")
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_NavigatesToVirtualCVPage() throws {
        app.buttons["Virtual CV"].tap()
        
        _ = app.staticTexts["John Doe's Virtual CV"].waitForExistence(timeout: 3)
        
        XCTAssertTrue(app.staticTexts["John Doe's Virtual CV"].exists)
    }

}
