//
//  CustomView.swift
//  firstapp
//
//  Created by Anya on 21.09.15.
//  Copyright © 2015 Anya. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    var counter = 0
    var flag = false
    
    var redColorComponent: CGFloat = 0.5
    var greenColorComponent: CGFloat = 0.5
    var blueColorComponent: CGFloat = 0.5
    
    
    override func drawRect(rect: CGRect) {

        
      
        let context: CGContextRef? = UIGraphicsGetCurrentContext()
        CGContextClearRect(context, self.bounds)
        
        if counter == 50 {
            print(50)
            redColorComponent = CGFloat(Float( arc4random() % 255 + 1 ) / 255.0)
            greenColorComponent = CGFloat(Float( arc4random() % 255 + 1 ) / 255.0)
            blueColorComponent = CGFloat(Float( arc4random() % 255 + 1 ) / 255.0)
            self.flag = true
        }
            
        else {
            //print(counter, flag)
            
            if (!self.flag) {
                redColorComponent = 0.5
                greenColorComponent = 0.5
                blueColorComponent = 0.5
            }

            
        }
        
        
        if (counter > 150) {
            flag = false
        }
//
//
//        CGContextSetRGBFillColor(context, redColorComponent, greenColorComponent, blueColorComponent, 1.0)
//        CGContextAddRect(context, CGRectMake(130.0, 100.0, 70, 70))
//        CGContextFillPath(context)
        
        
        CGContextSetRGBFillColor(context, redColorComponent, greenColorComponent, blueColorComponent, 1.0)
        CGContextAddEllipseInRect(context, CGRectMake(CGFloat(10 + self.counter), 70, 70, 70))
        CGContextFillPath(context)
        
        self.counter++
    } // end of drawRect
}
