//
//  SmileMemoViewModel.swift
//  GoodSmile
//
//  Created by 김상진 on 2023/10/08.
//

import Foundation
import UIKit

class SmileMemoViewModel: ObservableObject {
    let repository = RealmRepository<SmileMemo>()
    
    init() {
        
    }
    
    func saveSmileMemo(image: UIImage, smileInfo: SmileInfo) {
        let currentDate = Date().toString(DateStyle.storeId.rawValue)
        guard ImageManager.shared.saveImage(image: image, name: currentDate) else {
            print("이미지 저장 실패")
            return
        }
        let memo = SmileMemo(date: currentDate,
                             smileInfo: smileInfo)
        repository.add(item: memo)
    }
    
    func getSmileMemos() -> [SmileMemo] {
        return repository.getItem()
    }
}
