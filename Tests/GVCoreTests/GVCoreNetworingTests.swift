//
//  GVCoreNetworingTests.swift
//  GVCoreTests
//
//  Created by geovision on 2020/11/20.
//

import XCTest
@testable import GVCore

final class GVCoreNetworingTests: XCTestCase {


    func testVersionExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual("0.2.1", GVCore.version)
    }
    func testNetworkloadDataExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let manager = GVCore.Networking.Manager()
        let expectation = XCTestExpectation(description: "Called for data")
        guard let url = URL(string: "https://raywenderlich.com") else {
            return XCTFail("Could not create URL properly.")
        }
        manager.loadData(from: url){ result in
            expectation.fulfill()
            switch result {
            case .success(let returnedData):
                XCTAssertNotNil(returnedData, "Response data is nil")
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "error forming error result")
            }
        }
        wait(for: [expectation], timeout: 10)
    }

    static var allTests = [
        ("testVersionExample", testVersionExample),
        ("testNetworkloadDataExample", testNetworkloadDataExample),
        
    ]
}
