import XCTest
@testable import newCliffHeightTimer

class LabelFormatterTest: XCTestCase {
    func testZero() {
        let subject = LabelFormatter()
        
        XCTAssertEqual(subject.format(0.0), "0.00")
    }
    
    func testOne() {
        let subject = LabelFormatter()
        
        XCTAssertEqual(subject.format(1.0), "1.00")
    }
    
    func testTen() {
        let subject = LabelFormatter()
        
        XCTAssertEqual(subject.format(10.0), "10.00")
    }
}
