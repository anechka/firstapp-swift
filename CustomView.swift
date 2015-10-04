//
//  CustomView.swift
//  firstapp
//
//  Created by Anya on 21.09.15.
//  Copyright © 2015 Anya. All rights reserved.
//

import UIKit

class CustomView: UIView {

    var redColorComponent: CGFloat = 219/255
    var greenColorComponent: CGFloat = 243/255
    var blueColorComponent: CGFloat = 251/255

    
    override func drawRect(rect: CGRect) {
        print("override func drawRect")
        
        
        let context: CGContextRef? = UIGraphicsGetCurrentContext()
        CGContextClearRect(context, self.bounds)
        

//
//
//        CGContextSetRGBFillColor(context, redColorComponent, greenColorComponent, blueColorComponent, 1.0)
//        CGContextAddRect(context, CGRectMake(130.0, 100.0, 70, 70))
//        CGContextFillPath(context)
        
        
        CGContextSetRGBFillColor(context, redColorComponent, greenColorComponent, blueColorComponent, 1.0)
        CGContextAddEllipseInRect(context, CGRectMake(10, 30, 70, 70))
        CGContextFillPath(context)

    } // end of drawRect

    
}
