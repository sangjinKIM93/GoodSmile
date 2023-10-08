//
//  SmileMemo.swift
//  GoodSmile
//
//  Created by 김상진 on 2023/10/08.
//

import Foundation

struct SmileMemo {
    let imagePath: String
    let date: String
    let smileInfo: SmileInfo
}

struct SmileInfo {
    let eyeWideLeft: Float = 0
    let eyeWideRight: Float = 0
    let eyeBlinkLeft: Float = 0
    let eyeBlinkRight: Float = 0
    let smileRight: Float = 0
    let smileLeft: Float = 0
}
