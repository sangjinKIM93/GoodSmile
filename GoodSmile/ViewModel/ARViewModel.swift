//
//  ARViewModel.swift
//  GoodSmile
//
//  Created by 김상진 on 2023/10/03.
//

import Foundation
import RealityKit
import ARKit

class ARViewModel: UIViewController, ObservableObject, ARSessionDelegate {
    @Published private var model : ARModel = ARModel()
    
    var arView : ARView {
        model.arView
    }
    
    var isSmiling: Bool {
        var temp = false
        if model.isGoodSmile() {
            temp = true
        }
        return temp
    }
    
    func startSessionDelegate() {
        model.arView.session.delegate = self
        requestPermission()
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        if let faceAnchor = anchors.first  as? ARFaceAnchor {
            model.update(faceAnchor: faceAnchor)
        }
    }
    
    @Published var permissionGranted = true
    
    func requestPermission() {
        AVCaptureDevice.requestAccess(for: .video, completionHandler: {accessGranted in
            DispatchQueue.main.async {
//                withAnimation() {
                    self.permissionGranted = accessGranted
//                }
            }
        })
    }
}
