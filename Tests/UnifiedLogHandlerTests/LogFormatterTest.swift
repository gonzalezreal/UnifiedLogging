import Logging
@testable import UnifiedLogHandler
import XCTest

final class LogFormatterTest: XCTestCase {
    var sut = LogFormatter()

    func testFormatWithoutMetadata() {
        // given
        let expected = "Something happened"

        // when
        let result = sut.format(message: "Something happened", metadata: [:])

        // then
        XCTAssertEqual(result, expected)
    }

    func testFormatWithGlobalMetadata() {
        // given
        sut.metadata["foo"] = ["bar": "baz"]
        let expected = """
        Something happened
         ├─ Metadata
         │ foo: ["bar": "baz"]
        """

        // when
        let result = sut.format(message: "Something happened", metadata: [:])

        // then
        XCTAssertEqual(result, expected)
    }

    func testFormatWithLocalMetadata() {
        // given
        let expected = """
        Something happened
         ├─ Metadata
         │ info: ["foo", "bar", "baz"]
        """

        // when
        let result = sut.format(message: "Something happened", metadata: ["info": ["foo", "bar", "baz"]])

        // then
        XCTAssertEqual(result, expected)
    }

    func testFormatWithMetadata() {
        // given
        sut.metadata["foo"] = ["bar": "baz"]
        let expected = """
        Something happened
         ├─ Metadata
         │ foo: ["bar": "baz"]
         │ info: ["foo", "bar", "baz"]
        """

        // when
        let result = sut.format(message: "Something happened", metadata: ["info": ["foo", "bar", "baz"]])

        // then
        XCTAssertEqual(result, expected)
    }

    static var allTests = [
        ("testFormatWithoutMetadata", testFormatWithoutMetadata),
        ("testFormatWithGlobalMetadata", testFormatWithGlobalMetadata),
        ("testFormatWithLocalMetadata", testFormatWithLocalMetadata),
        ("testFormatWithMetadata", testFormatWithMetadata),
    ]
}
