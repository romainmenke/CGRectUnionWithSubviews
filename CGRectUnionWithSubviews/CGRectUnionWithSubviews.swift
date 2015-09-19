//
//  CGRectUnionWithSubviews.swift
//  CGRectUnionWithSubviews
//
//  Created by Romain Menke on 19/09/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import UIKit

extension UIView {
    
    func cgrectUnionWithSubviews() -> CGRect {
        
        return cgrectUnionWithNestedSubViews(self)
        
    }
    
    private func cgrectUnionWithNestedSubViews(view: UIView) -> CGRect {
        
        var rectUnion : CGRect = view.frame
        
        guard view.subviews.count > 0 else {
            return rectUnion
        }
        
        for subview in view.subviews {
            rectUnion = CGRectUnion(rectUnion, subview.frame)
            rectUnion = CGRectUnion(rectUnion, cgrectUnionWithNestedSubViews(subview))
            
        }
        return rectUnion
    }
    
}