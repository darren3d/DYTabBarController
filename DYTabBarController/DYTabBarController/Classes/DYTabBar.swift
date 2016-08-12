//
//  DYTabBar.swift
//  DYTabBarController
//
//  Created by darren on 16/8/12.
//  Copyright © 2016年 flashword. All rights reserved.
//

import UIKit

class DYTabBar: UITabBar {
    override func addSubview(view: UIView) {
        guard let view = view as? DYColorTab else {
            return
        }
        super.addSubview(view)
    }
}
