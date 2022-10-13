//
//  LottoMachine.swift
//  LottoMachine
//
//  Created by sejin on 2022/10/13.
//

import Foundation

struct LottoMachine {
    func isValidLottoNumbers(of numbers: [Int]) -> Bool {
        guard numbers.count == 6, Set(numbers).count == 6 else {
            return false
        }
        
        for num in numbers {
            guard 1...45 ~= num else {
                return false
            }
        }
        
        return true
    }
    
    func makeRandomLottoNumbersArray() -> [Int] {
        var numberSet: Set<Int> = []
        
        while numberSet.count < 6 {
            let randomNumber = Int.random(in: 1...45)
            numberSet.insert(randomNumber)
        }
        
        return Array(numberSet)
    }
    
    
    func countMatchingNumber(user: [Int], winner: [Int]) throws -> Int {
        guard isValidLottoNumbers(of: user) && isValidLottoNumbers(of: winner) else {
            throw LottoMachineError.invalidNumbers
        }
        
        let winNumbers = user.filter { winner.contains($0) }
        return winNumbers.count
    }
    
    func buyLotto(money: Int) throws -> [[Int]] {
        guard money >= 1000, money % 1000 == 0 else {
            throw LottoMachineError.invalidMoney
        }
        
        let count = money / 1000
        var res = [[Int]]()
        
        for _ in 0..<count {
            let lotto = makeRandomLottoNumbersArray()
            res.append(lotto)
        }
        
        return res
    }
    
    func getLottoResult(user: [Int], winner: [Int]) throws -> [Int] {
        do {
            let count = try countMatchingNumber(user: user, winner: winner)
            if count >= 3 {
                return [count, count*1000]
            } else {
                throw LottoMachineError.notWinner
            }
        } catch {
            throw LottoMachineError.invalidNumbers
        }
    }
}

enum LottoMachineError: Error {
    case invalidNumbers
    case invalidMoney
    case notWinner
}
