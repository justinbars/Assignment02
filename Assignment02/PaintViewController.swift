//
//  ViewController.swift
//  Assignment02
//
//  Created by mac on 5/3/15.
//  Copyright (c) 2015 Justin Barsketis. All rights reserved.
//

import UIKit


class PaintViewController: UIViewController, colorChangeDelegate, animateDelegate {

    var _paintView: PaintView = PaintView()
    var _watchView: WatchView = WatchView()
    var _colorView: ColorView = ColorView()
    
    //ar _menuController
    override func loadView() {
        //self.view.addSubview(_paintView)
        view = _paintView
        
        
        
        _colorView.frame = CGRectMake(0, UIScreen.mainScreen().bounds.height * 0.8, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height * 0.2)
        _colorView.backgroundColor = UIColor.whiteColor()
        self._colorView._colorChangeDelegate = self
        self._colorView._animateDelegate = self
        self.view.addSubview(_colorView)
        
  
  
        self.title = "Draw!"
        
        //view.addSubview(_colorView)
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        


        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func colorChange(color: UIColor)
    {
        
        println ("delegate success")
       _paintView.setColor(color)
        self.view.setNeedsDisplay()
        _colorView.setNeedsDisplay()
        
    }
    
    func pushAnimate ()
    {
        println("push animate")
    }

}

