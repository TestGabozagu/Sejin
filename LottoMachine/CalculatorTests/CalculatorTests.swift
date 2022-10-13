//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by sejin on 2022/10/13.
//

import XCTest
@testable import LottoMachine

final class CalculatorTests: XCTestCase {

    var sut: Calculator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Calculator()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_getNumbers호출시_nil을입력하면_에러throw하는지() {
        let input: String? = nil
        XCTAssertThrowsError(try sut.getNumbers(num: input))
    }
    
    func test_getNumbers호출시_빈스트링을입력하면_에러throw하는지() {
        let input = ""
        XCTAssertThrowsError(try sut.getNumbers(num: input))
    }
    
    func test_getNumbers호출시_플러스가포함된수를_입력하면_에러throw하는지() {
        let input = "14+2,3"
        XCTAssertThrowsError(try sut.getNumbers(num: input))
    }
    
    func test_getNumbers호출시_음수가포함된수를_입력하면_에러throw하는지() {
        let input = "1,2,-3"

         XCTAssertThrowsError(try sut.getNumbers(num: input))
    }
    
    
    func test_getNumbers호출시_정상적인Input을_입력하면_올바른값을_리턴하는지() {
        let input = "1,2,3:4"
        do {
            let result = try sut.getNumbers(num: input)
            XCTAssertEqual(10, result)
        } catch {
            XCTFail("fail: \(error)")
        }
    }
}
