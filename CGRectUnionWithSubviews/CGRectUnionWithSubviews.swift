//
//  CGRectUnionWithSubviews.swift
//  CGRectUnionWithSubviews
//
//  Created by Romain Menke on 19/09/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import UIKit

extension SubViewsRectUnion {
    
    mutating func setCGRectUnionWithSubviews() {
        frame = setCGRectUnionWithNestedSubViews(subviews, frame: frame)
        fixPositionOfSubViews(subviews, frame: frame)
        
    }
    
    func getCGRectUnionWithSubviews() -> CGRect {
        return getCGRectUnionWithNestedSubViews(subviews, frame: frame)
    }
    
    private func getCGRectUnionWithNestedSubViews(subviews: [UIView], frame frame_I: CGRect) -> CGRect {
        
        var rectUnion : CGRect = frame_I
        
        for subview in subviews {
            rectUnion = CGRectUnion(rectUnion, getCGRectUnionWithNestedSubViews(subview.subviews, frame: subview.frame))
        }
        return rectUnion
    }
    
    private func setCGRectUnionWithNestedSubViews(subviews: [UIView], frame frame_I: CGRect) -> CGRect {
        
        var rectUnion : CGRect = frame_I
        
        for subview in subviews {
            rectUnion = CGRectUnion(rectUnion, getCGRectUnionWithNestedSubViews(subview.subviews, frame: subview.frame))
        }
        return rectUnion
    }
    
    private func fixPositionOfSubViews(subviews: [UIView], frame frame_I: CGRect) {
        
        let fix : CGPoint = frame_I.origin
        
        for subview in subviews {
            subview.frame = CGRectOffset(subview.frame, -fix.x, -fix.y)
        }
    }
    
}

protocol SubViewsRectUnion {
    var frame : CGRect { get set }
    var subviews : [UIView] { get }
}

extension UIView : SubViewsRectUnion {
    
    
}