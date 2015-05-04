//
//  PaintView.swift
//  Assignment02
//
//  Created by mac on 5/3/15.
//  Copyright (c) 2015 Justin Barsketis. All rights reserved.
//

import UIKit

class PaintView: UIView
{
    private var points: [CGPoint] = []
    private var _pointCollection: [[CGPoint]] = []
    private var _colors: [UIColor] = []
    var percentDrawn: CGFloat = 1
    var pointsCollected: Int = 0
    private var color: UIColor = UIColor.whiteColor()
    
    func setColor (_color: UIColor)
    {
        color = _color
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect)
    {
        let context: CGContext = UIGraphicsGetCurrentContext()
        CGContextClearRect(context, rect)
        
        self.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height * 0.8)
        var pointsToDraw: CGFloat = CGFloat(points.count) * percentDrawn
        //println(pointsToDraw)
        
        

        for (var _collectionIndex: Int = 0; _collectionIndex < _pointCollection.count; _collectionIndex++)
        {
            var _points = _pointCollection[_collectionIndex]
            color = _colors[_collectionIndex]
            
            for (var pointIndex: Int = 0; pointIndex < _points.count; pointIndex++)
            {
                
                let point: CGPoint = _points[pointIndex]
                //print (point.x)
                //print (point.y)
                if (pointIndex == 0)
                {
                    
                    CGContextMoveToPoint(context, point.x, point.y)
                    
                }
                else
                {
                   
                    CGContextAddLineToPoint(context, point.x, point.y)
                  
                }
            }
            CGContextSetStrokeColorWithColor(context, color.CGColor)
            CGContextDrawPath(context, kCGPathStroke)
        }
        
        
    }
    
    private func getPointsFromTouch (touch: UITouch)
    {
        let touchPoint: CGPoint = touch.locationInView(self)
        points.append(touchPoint)
        pointsCollected++
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        getPointsFromTouch(touches.first as! UITouch)
        
        setNeedsDisplay()
        
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        getPointsFromTouch(touches.first as! UITouch)
 
        setNeedsDisplay()
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        getPointsFromTouch(touches.first as! UITouch)
        _pointCollection.append(points)
        _colors.append(color)
        points = []
        setNeedsDisplay()
        
    }
}