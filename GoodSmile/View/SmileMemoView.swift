//
//  SmileMemos.swift
//  GoodSmile
//
//  Created by 김상진 on 2023/10/07.
//

import SwiftUI

struct SmileMemoView: View {
    @Environment(\.presentationMode) var presentationMode
      var body: some View{
          
          VStack{
              HStack{
                  Spacer()
                  Button(action: {
                     presentationMode.wrappedValue.dismiss()
   
                  }) {
                      Image(systemName: "xmark")
                          .resizable()
                          .frame(width: 18, height: 18)
                  }
                  .padding(.top, 12.0)
                  .padding(.trailing, 16.0)
              }
              Spacer()
          }
      }
}

struct SmileMemos_Previews: PreviewProvider {
    static var previews: some View {
        SmileMemoView()
    }
}
