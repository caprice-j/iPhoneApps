//
//  AnimationUtility.swift
//  Gacha
//
//  Created by Master on 2015/04/16.
//  Copyright (c) 2015年 net.masuhara. All rights reserved.
//

import UIKit

class AnimationUtility: NSObject {
    override init() {
        super.init()
    }
    
    class func bobbingAnimation(imageView: UIImageView) {
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.7
        animation.repeatCount = Float.infinity
        animation.autoreverses = true
        animation.fromValue = NSValue(CGPoint: CGPointMake(imageView.center.x, imageView.center.y - 10))
        animation.toValue = NSValue(CGPoint: CGPointMake(imageView.center.x, imageView.center.y + 10))
        imageView.layer.addAnimation(animation, forKey: "position")
    }
    
    class func rotateAnimation(imageView: UIImageView) {
        
        let animation = CABasicAnimation(keyPath: "transform")
        animation.fromValue = NSNumber(double: 0.0)
        animation.toValue = NSNumber(double: 2 * M_PI)
        animation.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        animation.duration = 5.0;
        animation.repeatCount = Float.infinity;
        imageView.layer.addAnimation(animation, forKey: "transform")
    }
}
