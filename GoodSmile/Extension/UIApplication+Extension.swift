//
//  UIApplication+Extension.swift
//  GoodSmile
//
//  Created by 김상진 on 2023/10/06.
//

import UIKit

extension UIApplication {

    var screenShot: UIImage?  {

        if let rootViewController = keyWindow?.rootViewController {
            let scale = UIScreen.main.scale
            let bounds = rootViewController.view.bounds
            UIGraphicsBeginImageContextWithOptions(bounds.size, false, scale);
            if let _ = UIGraphicsGetCurrentContext() {
                rootViewController.view.drawHierarchy(in: bounds, afterScreenUpdates: true)
                let screenshot = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                return screenshot
            }
        }
        return nil
    }
}
