//
//  TabBarController.swift
//  DYTabBarController
//
//  Created by darren on 16/8/11.
//  Copyright © 2016年 flashword. All rights reserved.
//

import UIKit

class TabBarController : DYTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewControllers = tabViewControllers()
        for tabChildController in viewControllers {
            if let barItem = tabChildController.tabBarItem as? DYTabBarItem,
                let naviController = tabChildController as? UINavigationController {
                naviController.viewControllers[0].view.backgroundColor = barItem.colorBackground.colorWithAlphaComponent(0.2)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
