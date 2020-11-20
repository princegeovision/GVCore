import XCTest
@testable import GVCore

final class GVCoreTests: XCTestCase {

    func testColorRedEqual(){
        let color = GVCore.colorFromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }
    func testGVColorAreEqual(){
        let color = GVCore.colorFromHexString("006736")
        XCTAssertEqual(color, GVCore.defaultColor)
    }
    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
        ("testGVColorAreEqual", testGVColorAreEqual)
        
    ]
}
