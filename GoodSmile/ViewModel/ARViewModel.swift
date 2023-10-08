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
    var faceRing: FaceRing.Scene? // RCProject AR Ring On Success
    
    var arView : ARView {
        model.arView
    }
    
    var isSmiling: Bool {
        var temp = false
        if model.isGoodSmile() {
            temp = true
            faceRing?.notifications.ringAnimation.post()
        }
        return temp
    }
    
    func isSymmetryMouth() -> Bool {
        return model.isSymmetryMouth()
    }
    
    func isSymmetryEyeWidth() -> Bool {
        return model.isSymmetryEyeWidth()
    }
    
    func startSessionDelegate() {
        model.arView.session.delegate = self
        requestPermission()
        setFaceRingAnchor()
    }
    
    func setFaceRingAnchor() {
        let faceRingAnchor = try! FaceRing.loadScene()
        faceRing = faceRingAnchor
        arView.scene.anchors.append(faceRingAnchor)
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
    
    func getSmileInfo() -> SmileInfo {
        return SmileInfo(eyeWideLeft: model.eyeWideLeft,
                         eyeWideRight: model.eyeWideRight,
                         eyeBlinkLeft: model.eyeBlinkLeft,
                         eyeBlinkRight: model.eyeBlinkRight,
                         smileRight: model.smileRight,
                         smileLeft: model.smileLeft)
    }
}
