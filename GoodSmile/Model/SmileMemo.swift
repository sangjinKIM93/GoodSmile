//
//  SmileMemo.swift
//  GoodSmile
//
//  Created by 김상진 on 2023/10/08.
//

import Foundation
import RealmSwift

class SmileMemo: Object {
    @Persisted(primaryKey: true) var id: UUID
    @Persisted var date: String
    @Persisted var smileInfo: SmileInfo?
    
    convenience init(date: String, smileInfo: SmileInfo?) {
        self.init()
        self.date = date
        self.smileInfo = smileInfo
    }
}

class SmileInfo: Object {
    @Persisted var eyeWideLeft: Float
    @Persisted var eyeWideRight: Float
    @Persisted var eyeBlinkLeft: Float
    @Persisted var eyeBlinkRight: Float
    @Persisted var smileRight: Float
    @Persisted var smileLeft: Float
    
    convenience init(eyeWideLeft: Float = 0,
         eyeWideRight: Float = 0,
         eyeBlinkLeft: Float = 0,
         eyeBlinkRight: Float = 0,
         smileRight: Float = 0,
         smileLeft: Float = 0) {
        self.init()
        self.eyeWideLeft = eyeWideLeft
        self.eyeWideRight = eyeWideRight
        self.eyeBlinkLeft = eyeBlinkLeft
        self.eyeBlinkRight = eyeBlinkRight
        self.smileRight = smileRight
        self.smileLeft = smileLeft
    }
}
