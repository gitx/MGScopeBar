import XCTest
@testable import MGScopeBar

final class MGScopeBarTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
    }

    private func backgroundBrightness(of appearanceName: NSAppearance.Name) throws -> CGFloat {
        let bar = MGScopeBar(frame: NSRect(x: 0, y: 0, width: 200, height: 25))
        bar.appearance = NSAppearance(named: appearanceName)
        let rep = try XCTUnwrap(bar.bitmapImageRepForCachingDisplay(in: bar.bounds))
        bar.cacheDisplay(in: bar.bounds, to: rep)
        let color = try XCTUnwrap(rep.colorAt(x: rep.pixelsWide / 2, y: rep.pixelsHigh / 2))
        return try XCTUnwrap(color.usingColorSpace(.genericGray)).whiteComponent
    }

    func testBackgroundIsLightInAquaAppearance() throws {
        XCTAssertEqual(try backgroundBrightness(of: .aqua), 0.825, accuracy: 0.03)
    }

    func testBackgroundIsDarkInDarkAquaAppearance() throws {
        XCTAssertLessThan(try backgroundBrightness(of: .darkAqua), 0.35)
    }
}
