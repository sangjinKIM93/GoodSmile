//
//  ARModel.swift
//  GoodSmile
//
//  Created by 김상진 on 2023/10/03.
//

import Foundation
import RealityKit
import ARKit

struct ARModel {
    private(set) var arView : ARView
    
    var eyeWideLeft: Float = 0
    var eyeWideRight: Float = 0
    var smileRight: Float = 0
    var smileLeft: Float = 0
    
    init() {
        arView = ARView(frame: .zero)
        arView.session.run(ARFaceTrackingConfiguration())
    }
    
    mutating func update(faceAnchor: ARFaceAnchor){
        eyeWideLeft = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .eyeWideLeft})?.value ?? 0)
        eyeWideRight = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .eyeWideRight})?.value ?? 0)
        
        smileRight = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .mouthSmileRight})?.value ?? 0)
        smileLeft = Float(truncating: faceAnchor.blendShapes.first(where: {$0.key == .mouthSmileLeft})?.value ?? 0)
    }
    
    func isSymmetryMouth() -> Bool {
        let isSymmetryMouth = (smileLeft / smileRight) > 0.99 && (smileLeft / smileRight) < 1.1
        return isSymmetryMouth
    }
    
    func isSymmetryEyeWidth() -> Bool {
        let isSymmetryEyeWidth = (eyeWideLeft / eyeWideRight) > 0.99 && (eyeWideLeft / eyeWideRight) < 1.1
        return isSymmetryEyeWidth
    }
    
    func isGoodSmile() -> Bool {
        print("\(isSymmetryMouth()) && \(isSymmetryEyeWidth())")
        return isSymmetryMouth() && isSymmetryEyeWidth()
    }
}
