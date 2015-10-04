//
//  ViewController.swift
//  firstapp
//
//  Created by Anya on 12.09.15.
//  Copyright © 2015 Anya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var switcherFlag: Bool = false
    let blueLayer: CALayer = CALayer()
    
    @IBOutlet weak var simpleButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btnSwitcher: UISwitch!
    
    @IBAction func touchDownButton(sender: AnyObject) {
        
        let formatter: NSDateFormatter = NSDateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("dd-MM-yyyy HH:mm")
        
        let dateString: String = formatter.stringFromDate(NSDate())
        textField.text = dateString
        
        
        simpleButton.setTitle("Аня Новикова", forState: UIControlState.Normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        let mycustomView = CustomView()
        
        let tapRec = UITapGestureRecognizer(target: self, action: "tapHandler")
        mycustomView.addGestureRecognizer(tapRec)

        blueLayer.delegate = self
        
        blueLayer.frame = CGRectMake(50.0, 50.0, 100.0, 100.0);
        blueLayer.backgroundColor = UIColor.blueColor().CGColor;
        
        
        blueLayer.position = CGPoint(x: CGFloat(self.view.bounds.size.width) / 2, y: CGFloat(self.view.bounds.size.height) / 2)
        
        mycustomView.layer.addSublayer(blueLayer)
        
    
        
        
        self.view = mycustomView
        blueLayer.setNeedsDisplay()

        

        
    }// end view didload
    
    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
        print("drawLayer")
        
        CGContextSetFillColorWithColor(ctx, UIColor.redColor().CGColor)
        CGContextAddRect(ctx, CGRectMake(0.0, 0.0, 40, 40))
        CGContextFillPath(ctx)
    }
    
    func timehandler() {
        self.view.setNeedsDisplay()
    }
    
    
    func tapHandler() {
       print("tap")
        
        
        let theAnim = CABasicAnimation(keyPath: "position")
        theAnim.fromValue = NSValue(CGPoint: CGPoint(x: CGFloat(self.view.bounds.size.width) / 2, y: CGFloat(self.view.bounds.size.height) / 2 ))
        theAnim.toValue = NSValue(CGPoint: CGPoint(x: CGFloat(self.view.bounds.size.width) / 2 + 50.0, y: CGFloat(self.view.bounds.size.height) / 2))
        theAnim.duration = 3
        
        blueLayer.addAnimation(theAnim, forKey: "position")
    }


    @IBAction func switchHandler(switcher: UISwitch) {
        self.switcherFlag = switcher.on
        
        UIView.animateWithDuration(3, delay: 0, options: UIViewAnimationOptions.CurveEaseIn , animations: {
            
            print(" x= \(self.simpleButton.frame.origin.x), y= \(self.simpleButton.frame.origin.y)")
            
            self.simpleButton.frame.origin.y += self.switcherFlag ? -150.0 : 150.0
            self.view.backgroundColor = self.switcherFlag ? UIColor.greenColor() : UIColor.orangeColor()
            
            },
            completion: nil
        )
        
    }

}

