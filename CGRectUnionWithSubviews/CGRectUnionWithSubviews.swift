//
//  CGRectUnionWithSubviews.swift
//  CGRectUnionWithSubviews
//
//  Created by Romain Menke on 19/09/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import UIKit

extension SubViewsRectUnion {
    
    func cgrectUnionWithSubviews() -> CGRect {
        return cgrectUnionWithNestedSubViews(subviews, frame: frame)
    }
    
    private func cgrectUnionWithNestedSubViews(subviews: [UIView], frame: CGRect) -> CGRect {
        
        var rectUnion : CGRect = frame
        
        for subview in subviews {
            rectUnion = CGRectUnion(rectUnion, cgrectUnionWithNestedSubViews(subview.subviews, frame: subview.frame))
        }
        return rectUnion
    }
}

protocol SubViewsRectUnion {
    var frame : CGRect { get }
    var subviews : [UIView] { get }
}

extension UIView : SubViewsRectUnion {
    
    
}