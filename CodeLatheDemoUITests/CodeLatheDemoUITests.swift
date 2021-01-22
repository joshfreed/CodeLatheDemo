//
//  CodeLatheDemoUITests.swift
//  CodeLatheDemoUITests
//
//  Created by Josh Freed on 1/21/21.
//

import XCTest

class CodeLatheDemoUITests: XCTestCase {
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

    func testFirstScreenListsBreweries() throws {
        XCTAssertTrue(app.navigationBars["Breweries"].exists)
        
        XCTAssertTrue(app.tables.staticTexts["Dock Street Brewery"].exists)
        XCTAssertTrue(app.tables.staticTexts["701 S 50th St Fl 1"].exists)
        
        XCTAssertTrue(app.tables.staticTexts["Evil Genius Beer Co"].exists)
        XCTAssertTrue(app.tables.staticTexts["1727 N Front St"].exists)
    }
}
