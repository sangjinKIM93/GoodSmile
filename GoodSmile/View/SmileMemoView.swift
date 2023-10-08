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
              GridListView()
              Spacer()
          }
      }
    
    var items: [GridItem] {
      [
        GridItem(.flexible()),
        GridItem(.flexible()),
      ]
    }
    func GridListView() -> some View {
        LazyVGrid(columns: items, spacing: 10) {
            ForEach(viewModel.getSmileMemos(), id: \.id) { memo in
                SmileMemoCardView(memo: memo,
                                  image: viewModel.getImage(name: memo.date))
            }
            .padding(.horizontal)
        }
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
