//
//  DoubleExtension.swift
//  GoodSmile
//
//  Created by 김상진 on 2023/10/08.
//

import Foundation

extension Float {
    func cut(n: Int) -> Float {
        let decimalPlaces = Float(pow(10.0, Float(n)))
        return floor(self * decimalPlaces) / decimalPlaces
    }
    
    func toStringCutted(n: Int) -> String {
        String(format: "%.\(n)f", self)
    }
}
