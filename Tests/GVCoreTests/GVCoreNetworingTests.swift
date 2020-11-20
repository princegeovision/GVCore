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
    
    func post(with request: URLRequest, completionHandler: @escaping (Data?, Error?) -> Void) {
        
        completionHandler(data, error)
    }
}
//Codable is key point.
struct MockData: Codable, Equatable {
    var id: Int
    var name: String
}

final class GVCoreNetworingTests: XCTestCase {


    func testVersionExample() {
        XCTAssertEqual("0.3.0", GVCore.version)
    }
    func testFakeNetworkloadDataExample() {

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
    func testSendDataExample(){
        let manager = GVCore.Networking.Manager()
        let session = NetworkSessionMock()
        
        let sample = MockData(id: 1, name: "Alice")
        let data = try? JSONEncoder().encode(sample)
        session.data = data
        manager.session = session
        let expectation = XCTestExpectation(description: "Send data")
        let url = URL(fileURLWithPath: "url")
        manager.sendData(to: url, body: sample){ result in
            expectation.fulfill()
            switch result {
            case .success(let returnedData):
                let returnedObject = try? JSONDecoder().decode(MockData.self, from: returnedData)
                XCTAssertEqual(returnedObject, sample)
                break
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "error forming error result")
            }
        }
        wait(for: [expectation], timeout: 5)
    }

    static var allTests = [
        ("testVersionExample", testVersionExample),
        ("testFakeNetworkloadDataExample", testFakeNetworkloadDataExample),
        ("testRealNetworkloadDataExample", testRealNetworkloadDataExample),
        ("testSendDataExample", testSendDataExample)
    ]
}
