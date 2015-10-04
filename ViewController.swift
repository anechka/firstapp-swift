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
        
        
        //let tapRec = UITapGestureRecognizer(target: self, action: "tapHandler")
        //simpleButton.addGestureRecognizer(tapRec)
        

        
        self.view = mycustomView
        
        NSTimer.scheduledTimerWithTimeInterval(0.0400, target: self, selector: "timehandler",
            userInfo: nil, repeats: true)
    }// end view didload
    
    
    func timehandler() {
        self.view.setNeedsDisplay()
    }
    
    
    func tapHandler() {
       print("tap")
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

