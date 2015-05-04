//
//  colorView.swift
//  Assignment02
//
//  Created by mac on 5/3/15.
//  Copyright (c) 2015 Justin Barsketis. All rights reserved.
//

import UIKit
protocol animateDelegate
{
    func pushAnimate ()
}
protocol colorChangeDelegate
{
    func colorChange(color: UIColor)
}
class ColorView: UIView
{
    var _animateDelegate: animateDelegate? = nil
    var _colorChangeDelegate: colorChangeDelegate? = nil
    
    override func drawRect(rect: CGRect) {
       
        
        
        
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.cyanColor().CGColor
        
        
        let animateButton = UIButton()
        
        var animateWidth: CGFloat = self.frame.width * 0.6
        var animateHeight: CGFloat = self.frame.height * 0.20
        var middleX: CGFloat = UIScreen.mainScreen().bounds.width / 2
        
        animateButton.setTitle("Animate", forState: .Normal)
        animateButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        animateButton.setTitleColor(UIColor.lightGrayColor(), forState: .Selected)
        animateButton.titleLabel?.font = UIFont(name: "HelveticaNeue-UltraLight", size: 16)
        animateButton.layer.cornerRadius = 5
        animateButton.layer.borderWidth = 1
        animateButton.layer.borderColor = UIColor.blackColor().CGColor
        
        animateButton.frame = CGRectMake(middleX - (animateWidth / 2), self.frame.height - (animateHeight + 10), animateWidth, animateHeight)
        animateButton.addTarget(self, action: "animatePressed:", forControlEvents: .TouchUpInside)
        
        self.addSubview(animateButton)
        
        var colorWidth: CGFloat = self.frame.width * 0.1


        
        for (var index: Int = 0; index < 10; index++)
        {
            var colorBlotch: UIButton = UIButton()
            var color: UIColor = UIColor.redColor()
            switch index
            {
            case 1:
                color = UIColor.orangeColor()
            case 2:
                color = UIColor.yellowColor()
            case 3:
                color = UIColor.greenColor()
            case 4:
                color = UIColor.blueColor()
            case 5:
                color = UIColor.cyanColor()
            case 6:
                color = UIColor.blueColor()
            case 7:
                color = UIColor.blackColor()
            case 8:
                color = UIColor.brownColor()
            case 9:
                color = UIColor.purpleColor()
            default:
                color = UIColor.redColor()
                
            }
            
            colorBlotch.backgroundColor = color
            colorBlotch.layer.cornerRadius = 10
            colorBlotch.layer.borderWidth = 1
            colorBlotch.layer.borderColor = UIColor.blackColor().CGColor
            colorBlotch.frame = CGRectMake(colorWidth * CGFloat(index), self.frame.height * 0.2, colorWidth, colorWidth)
            colorBlotch.addTarget(self, action: "colorPressed:", forControlEvents: .TouchUpInside)
            self.addSubview(colorBlotch)
        }
        
        setNeedsDisplay()
        

        
    }
    
    func animatePressed(sender: UIButton!) {
        if (_animateDelegate != nil)
        {
            _animateDelegate!.pushAnimate()
        }
        
        
    }
    func colorPressed(sender: UIButton!) {
        if (_colorChangeDelegate != nil)
        {
            _colorChangeDelegate!.colorChange(sender.backgroundColor!)
        }

        
    }
    
}
