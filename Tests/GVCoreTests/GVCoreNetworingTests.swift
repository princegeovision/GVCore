//
//  GVCoreNetworingTests.swift
//  GVCoreTests
//
//  Created by geovision on 2020/11/20.
//

import XCTest
@testable import GVCore

class NetworkSessionMock: NetworkSession {
    //Store property
    var data: Data?
    var error: Error?
    
    //protocol function1:
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        //data == nil, so it will fail
        data = Data() // make test case OK.
        completionHandler(data, error)
    }
    
    
}

final class GVCoreNetworingTests: XCTestCase {


    func testVersionExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual("0.2.2", GVCore.version)
    }
    func testFakeNetworkloadDataExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let manager = GVCore.Networking.Manager()
        let sess = NetworkSessionMock()
        manager.session = sess
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
        wait(for: [expectation], timeout: 1)
    }
    func testRealNetworkloadDataExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let manager = GVCore.Networking.Manager()
        //let sess = NetworkSessionMock()
        //manager.session = sess
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
        ("testFakeNetworkloadDataExample", testFakeNetworkloadDataExample),
        ("testRealNetworkloadDataExample", testRealNetworkloadDataExample),
        
    ]
}
