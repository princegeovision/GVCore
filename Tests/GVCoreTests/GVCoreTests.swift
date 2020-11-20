import XCTest
@testable import GVCore

final class GVCoreTests: XCTestCase {

    func testColorRedEqual(){
        let color = GVCore.colorFromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }
    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
        
    ]
}
