import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(LogFormatterTest.allTests),
        ]
    }
#endif
