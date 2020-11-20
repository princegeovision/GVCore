import XCTest
@testable import GVCore

final class GVCoreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GVCore().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
