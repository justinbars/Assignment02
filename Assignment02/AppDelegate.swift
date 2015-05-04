//
//  AppDelegate.swift
//  Assignment02
//
//  Created by mac on 5/3/15.
//  Copyright (c) 2015 Justin Barsketis. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow( frame: UIScreen.mainScreen().bounds)
        //var _containerView: ContainerViewController = ContainerViewController()
        window?.rootViewController = UINavigationController(rootViewController: PaintViewController())
        
        window?.makeKeyAndVisible()
        return true
    }

    

}

