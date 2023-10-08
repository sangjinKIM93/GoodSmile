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
        VStack(alignment: .leading) {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            }
            VStack(alignment: .leading) {
                if let smileInfo = memo.smileInfo {
                    Text("\(memo.date)")
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                        .padding(.bottom, 2)
                    Group {
                        Text("입꼬리(좌): \(smileInfo.smileLeft.toStringCutted(n: 4))")
                        Text("입꼬리(우): \(smileInfo.smileRight.toStringCutted(n: 4))")
                        Text("입꼬리 대칭률: \((smileInfo.smileLeft/smileInfo.smileRight).toStringCutted(n: 4))")
                    }
                    .font(.system(size: 11))
                    .foregroundColor(Color(hex: "7C7A7A"))
                }
            }
            .padding(.bottom, 5)
            .padding(.leading, 5)
            
        }
        .background(Color.white)
        .cornerRadius(8)
    }
}

//struct SmileMemoCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        SmileMemoCardView(.constant(SmileMemo()))
//    }
//}
