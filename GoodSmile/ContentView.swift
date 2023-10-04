//
//  ContentView.swift
//  GoodSmile
//
//  Created by 김상진 on 2023/10/03.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @ObservedObject var arViewModel : ARViewModel = ARViewModel()
    var body: some View {
        ZStack {
            ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
            VStack {
                Text(arViewModel.isSymmetryEyeWidth() ? "Eyes Good 😄" : "Eyes Bad 😐")
                    .padding()
                    .foregroundColor(arViewModel.isSymmetryEyeWidth() ? .green : .red)
                    .background(RoundedRectangle(cornerRadius: 25).fill(.regularMaterial))
                Text(arViewModel.isSymmetryMouth() ? "Mouth Good 😄" : "Mouth Bad 😐")
                    .padding()
                    .foregroundColor(arViewModel.isSymmetryMouth() ? .green : .red)
                    .background(RoundedRectangle(cornerRadius: 25).fill(.regularMaterial))
                Spacer()
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    var arViewModel: ARViewModel
    func makeUIView(context: Context) -> ARView {
        arViewModel.startSessionDelegate()
        return arViewModel.arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
