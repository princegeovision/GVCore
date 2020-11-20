import XCTest
@testable import GVCore

final class GVCoreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GVCoreStruct().text, "Hello, World!")
    }
//    func testVersion(){
//        XCTAssertEqual(GVCore.version, "0.1.0")
//    }

    static var allTests = [
        ("testExample", testExample),
        //("testVersion", testVersion)
    ]
}
