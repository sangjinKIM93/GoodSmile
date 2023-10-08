//
//  SmileMemos.swift
//  GoodSmile
//
//  Created by 김상진 on 2023/10/07.
//

import SwiftUI

struct SmileMemoView: View {
    @ObservedObject var viewModel = SmileMemoViewModel()
    @Environment(\.presentationMode) var presentationMode
    
      var body: some View{
          VStack{
              NavigationBar()
              Spacer().frame(height: 20)
              GridListView()
              Spacer()
          }
          .background(Color(hex: "D8D8DD"))
      }
    
    var items: [GridItem] {
      [
        GridItem(.flexible(minimum: 40), spacing: 10),
        GridItem(.flexible(minimum: 40), spacing: 10),
        GridItem(.flexible(minimum: 40), spacing: 0),
      ]
    }
    func GridListView() -> some View {
        LazyVGrid(columns: items, spacing: 0) {
            ForEach(viewModel.getSmileMemos(), id: \.id) { memo in
                SmileMemoCardView(memo: memo,
                                  image: viewModel.getImage(name: memo.date))
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 14)
    }
    
    func NavigationBar() -> some View {
        HStack{
            Spacer()
            Button(action: {
               presentationMode.wrappedValue.dismiss()

            }) {
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(Color.black)
            }
            .padding(.top, 12.0)
            .padding(.trailing, 16.0)
        }
    }
}

struct SmileMemos_Previews: PreviewProvider {
    static var previews: some View {
        SmileMemoView()
    }
}
