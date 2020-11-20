import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(GVCoreColorTests.allTests),
        testCase(GVCoreNetworingTests.allTests),
    ]
}
#endif
