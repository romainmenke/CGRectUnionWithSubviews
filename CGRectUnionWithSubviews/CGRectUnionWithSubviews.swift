//
//  CGRectUnionWithSubviews.swift
//  CGRectUnionWithSubviews
//
//  Created by Romain Menke on 19/09/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import UIKit

extension SubviewsCGRectUnion {
    
    mutating func setCGRectUnionWithSubviews() {
        frame = getCGRectUnionWithNestedSubviews(subviews: subviews, frame: frame)
        fixPositionOfSubviews(subviews, frame: frame)
    }
    
    func getCGRectUnionWithSubviews() -> CGRect {
        return getCGRectUnionWithNestedSubviews(subviews: subviews, frame: frame)
    }
    
    private func getCGRectUnionWithNestedSubviews(subviews subviews_I: [UIView], frame frame_I: CGRect) -> CGRect {
        
        var rectUnion : CGRect = frame_I
        for subview in subviews_I {
            rectUnion = CGRectUnion(rectUnion, getCGRectUnionWithNestedSubviews(subviews: subview.subviews, frame: subview.frame))
        }
        return rectUnion
    }

    private func fixPositionOfSubviews(subviews: [UIView], frame frame_I: CGRect) {
        
        let frameFix : CGPoint = frame_I.origin
        for subview in subviews {
            subview.frame = CGRectOffset(subview.frame, -frameFix.x, -frameFix.y)
        }
    }
}

protocol SubviewsCGRectUnion {
    var frame : CGRect { get set }
    var subviews : [UIView] { get }
}

extension UIView : SubviewsCGRectUnion {
}