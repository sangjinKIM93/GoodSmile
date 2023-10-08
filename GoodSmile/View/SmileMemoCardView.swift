//
//  SmileMemoCardView.swift
//  GoodSmile
//
//  Created by 김상진 on 2023/10/08.
//

import SwiftUI
import UIKit

struct SmileMemoCardView: View {
    var memo: SmileMemo
    var image: UIImage?
    
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .frame(height: 150)
                
            }
            VStack(alignment: .leading) {
                if let smileInfo = memo.smileInfo {
                    Text("입꼬리(좌): \(smileInfo.smileLeft.toStringCutted(n: 4))")
                    Text("입꼬리(우): \(smileInfo.smileRight.toStringCutted(n: 4))")
                    Text("입꼬리 대칭률: \((smileInfo.smileLeft/smileInfo.smileRight).toStringCutted(n: 4))")
                }
            }
            .font(.system(size: 12))
        }
    }
}

//struct SmileMemoCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        SmileMemoCardView(.constant(SmileMemo()))
//    }
//}
