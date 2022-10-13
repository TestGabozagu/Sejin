//
//  LottoMachineTests.swift
//  LottoMachineTests
//
//  Created by sejin on 2022/10/13.
//

import XCTest
@testable import LottoMachine

final class LottoMachineTests: XCTestCase {
    var sut: LottoMachine!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LottoMachine()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_buyLotto호출시_1000미만_입력했을때_에러throw하는지() {
        let input = 900
        
        // let result = try sut.buyLotto(money: input)
        
        XCTAssertThrowsError(try sut.buyLotto(money: input))
    }
    
    func test_buyLotto호출시_1000단위아닌수_입력했을때_에러throw하는지() {
        let input = 1100
        
        XCTAssertThrowsError(try sut.buyLotto(money: input))
    }
    
    func test_buyLotto호출시_1000이상_1000단위수_입력했을때_에러throw안하는지() {
        let input = 3000
        
        XCTAssertNoThrow(try sut.buyLotto(money: input))
    }
    
    func test_buyLotto호출시_1000단위수_입력했을때_알맞은_개수의로또반환하는지() {
        let input = 4000
        
        do {
            let result = try sut.buyLotto(money: input)
            XCTAssertEqual(input/1000, result.count)
        } catch {
            XCTFail("fail: \(error)")
        }
    }
    
    func test_getLottoResult호출시_6자리미만수_입력했을때_에러throw하는지() {
        let input1 = [1,2,3,4,5]
        let input2 = [1,2,3,4,5,6]
        
        XCTAssertThrowsError(try sut.getLottoResult(user: input1, winner: input2))
    }
    
    func test_getLottoResult호출시_알맞은형태의input_입력시_일치개수와_당첨금반환하는지() {
        let input1 = [1,2,3,4,5,6]
        let input2 = [1,4,5,8,9,10]
        
        do {
            let result = try sut.getLottoResult(user: input1, winner: input2)
            XCTAssertEqual([3,3000], result)
        } catch {
            XCTFail("fail: \(error)")
        }
    }
    
}
