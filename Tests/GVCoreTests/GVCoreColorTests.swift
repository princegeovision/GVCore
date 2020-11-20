import XCTest
@testable import GVCore

final class GVCoreColorTests: XCTestCase {

    func testColorRedEqual(){
        let color = GVCore.Color.fromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }
    func testGVColorAreEqual(){
        let color = GVCore.Color.fromHexString("005FFF")
        XCTAssertEqual(color, GVCore.Color.defaultColor)
    }
    func testGVColor2AreEqual(){
        let color = GVCore.Color.fromHexString("7B90AA")
        XCTAssertEqual(color, GVCore.Color.gveyeColor)
    }
    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
        ("testGVColorAreEqual", testGVColorAreEqual),
        ("testGVColor2AreEqual", testGVColor2AreEqual)
    ]
}
