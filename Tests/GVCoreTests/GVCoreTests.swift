import XCTest
@testable import GVCore

final class GVCoreTests: XCTestCase {

    func testColorRedEqual(){
        let color = GVCore.colorFromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }
    func testGVColorAreEqual(){
        let color = GVCore.colorFromHexString("005FFF")
        XCTAssertEqual(color, GVCore.defaultColor)
    }
    func testGVColor2AreEqual(){
        let color = GVCore.colorFromHexString("7B90AA")
        XCTAssertEqual(color, GVCore.gveyeColor)
    }
    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
        ("testGVColorAreEqual", testGVColorAreEqual),
        ("testGVColor2AreEqual", testGVColor2AreEqual)
    ]
}
