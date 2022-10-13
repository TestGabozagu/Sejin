//
//  Calculator.swift
//  LottoMachine
//
//  Created by sejin on 2022/10/13.
//

import Foundation

struct Calculator {
    func getNumbers(num: String?) throws -> Int {
        guard let num = num else {
            throw CalculatorError.inputIsNil
        }
        
        guard num != "" else {
            throw CalculatorError.emptyInput
        }
        
        let arr = try num.components(separatedBy: [",", ":"]).map {
            guard let n = Int($0) else {
                throw CalculatorError.invalidNumbers
            }
            return n
        }
        
        var res = 0
        
        if !arr.isEmpty {
            for x in arr {
                if x < 0 {
                    throw CalculatorError.negativeNumbers
                } else {
                    res += x
                }
            }
        }
        
        return res
    }
}


enum CalculatorError: Error {
    case inputIsNil
    case emptyInput
    case invalidNumbers
    case negativeNumbers
}
