//
//  Drawing.swift
//  Assignment02
//
//  Created by mac on 5/3/15.
//  Copyright (c) 2015 Justin Barsketis. All rights reserved.
//

import Foundation
import UIKit

class Drawing
{
    var polyLineCount: Int { return 3 }
    
    struct pointF
    {
        var x: Float
        var y: Float
    }
    
    struct polyLine
    {
        var points: [pointF]
        var color: UIColor
        
    }
    
    
    func polyLineAtIndex (polyLineIndex: Int) -> polyLine
    {
        return polyLine(points: [pointF(x: 0.0, y: 0.0)], color: UIColor.blackColor())
    }
    
}