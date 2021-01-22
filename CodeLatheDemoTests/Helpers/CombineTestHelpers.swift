//
//  CombineTestHelpers.swift
//  CodeLatheDemoTests
//
//  Created by Josh Freed on 1/22/21.
//

import Foundation
import Combine
import XCTest

/**
 
 This is a whole lot of code I pulled from the web and my other projects to make it simpler to
 test the results of combine publishers (e.g., the result of @Published vars).
 
 */

extension Recorder {
    /// Possible types of records.
    public enum Record {
        case value(Input)
        case completion(Subscribers.Completion<Failure>)
    }
}

/// A subscriber which records all values from the attached publisher.
public class Recorder<Input, Failure: Error> {
    public var records: [Record] = [] {
        didSet {
            if numberOfRecords == records.count {
                expectation.fulfill()
            }
        }
    }
    
    public init(numberOfRecords: Int) {
        assert(numberOfRecords > 0, "numberOfRecords must be greater than zero.")
        self.numberOfRecords = numberOfRecords
    }
    
    private let numberOfRecords: Int
    private var isFirstValue = true
    
    // 1.
    // We use XCTestExpectation and XCTWaiter to pause
    // the execution of the program. We don't need to provide
    // a custom message to the expectation, because we're not
    // going to surface it to the user.
    private let expectation = XCTestExpectation()
    private let waiter = XCTWaiter()
    
    /// Pauses the execution of the current test and waits,
    /// until the required number of values is recorded.
    ///
    /// - Parameter timeout: The amount of time within which
    /// the required number of records should be recorded.
    public func waitForAllValues(
        timeout: TimeInterval = 1,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        
        // 2.
        // If we already have the number of records we need, we can
        // return and continue without blocking the execution.
        guard records.count < numberOfRecords else { return }
        
        // 3.
        // We want to wait until the expectation is fulfilled. This
        // is the very line that actually blocks the further execution
        // of the program.
        let result = waiter.wait(for: [expectation], timeout: timeout)
        
        // 4.
        // We need to check the result of the waiter. If the expectation
        // wasn't successfully fulfilled, we need to fail the test.
        // Otherwise, we can finally return from this function and continue.
        if result != .completed {
            func valueFormatter(_ count: Int) -> String {
                "\(count) value" + (count == 1 ? "" : "s")
            }
            
            XCTFail("""
 Waiting for \(valueFormatter(numberOfRecords)) timed out. Received only \(valueFormatter(records.count)).
 """,
                    file: file,
                    line: line
            )
        }
    }
}

extension Recorder: Subscriber {
    public func receive(subscription: Subscription) {
        // The number of values we request from the publisher is unlimited.
        subscription.request(.unlimited)
    }
    
    public func receive(_ input: Input) -> Subscribers.Demand {
        if isFirstValue {
            isFirstValue = false
            return .unlimited
        }
        
        // Because the `receive` function can be called on any thread, we need
        // to always dispatch on the main thread.
        DispatchQueue.main.async {
            self.records.append(.value(input))
        }
        return .unlimited
    }
    
    public func receive(completion: Subscribers.Completion<Failure>) {
        DispatchQueue.main.async {
            self.records.append(.completion(completion))
        }
    }
}

extension Publisher {
    /// Creates a new recorder subscribed to this publisher.
    public func record(numberOfRecords: Int) -> Recorder<Output, Failure> {
        let recorder = Recorder<Output, Failure>(numberOfRecords: numberOfRecords)
        subscribe(recorder)
        return recorder
    }
}

extension Recorder.Record: Equatable where Input: Equatable, Failure: Equatable
{ }

extension Recorder.Record: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .value(inputValue):
            return "\(inputValue)"
        case let .completion(completionValue):
            return "\(completionValue)"
        }
    }
}

public func XCTAssertRecordedValues<Input: Equatable, Failure: Error>(
    _ recorder: Recorder<Input, Failure>,
    _ expectedValues: [Input],
    file: StaticString = #file,
    line: UInt = #line
) {
    recorder.waitForAllValues(file: file, line: line)
    
    // Get only the values, ignore other records
    let values = recorder.records.compactMap { record -> Input? in
        if case let .value(inputValue) = record {
            return inputValue
        } else {
            return nil
        }
    }
    XCTAssertEqual(values, expectedValues, file: file, line: line)
}

