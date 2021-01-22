//
//  ListBreweriesViewModelTests.swift
//  CodeLatheDemoTests
//
//  Created by Josh Freed on 1/22/21.
//

import XCTest
import Combine
@testable import CodeLatheDemo

class ListBreweriesViewModelTests: XCTestCase {
    let breweryService = FakeBreweryService()
    var sut: ListBreweriesViewModel!
    var cancellables = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        sut = ListBreweriesViewModel(breweryService: breweryService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConstructingNewInstance() throws {
        XCTAssertFalse(sut.isLoading)
        XCTAssertEqual([], sut.breweries)
    }
    
    // MARK: List breweries
    
    func test_listBreweries_passes_the_city_name_in() {
        sut.listBreweries()
        XCTAssertEqual("Philadelphia", breweryService.argCity)
    }
    
    func test_listBreweries_success() {
        let isLoadingRecorder = sut.$isLoading.record(numberOfRecords: 2)
        let breweriesRecorder = sut.$breweries.record(numberOfRecords: 1)
        let breweries: [Brewery] = [
            .init(id: 1, name: "Cool Brews", street: "123 Fake Street"),
            .init(id: 2, name: "IPAs All Day", street: "555 Main Street Road")
        ]
        breweryService.listBreweriesByResponse = .success(breweries)

        sut.listBreweries()
                        
        XCTAssertRecordedValues(isLoadingRecorder, [true, false])
        XCTAssertRecordedValues(breweriesRecorder, [breweries])
    }
    
    func test_listBreweries_error() {
        let isLoadingRecorder = sut.$isLoading.record(numberOfRecords: 2)
        let isErrorRecorder = sut.$isLoadingError.record(numberOfRecords: 2)
        let breweries = sut.$breweries.record(numberOfRecords: 1)
        breweryService.listBreweriesByResponse = .failure(TestError.testError)
        
        sut.listBreweries()

        XCTAssertRecordedValues(isLoadingRecorder, [true, false])
        XCTAssertRecordedValues(isErrorRecorder, [false, true])
        XCTAssertRecordedValues(breweries, [[]])
    }
        
    // MARK: - Helpers
    
    enum TestError: Error {
        case testError
    }    
}
