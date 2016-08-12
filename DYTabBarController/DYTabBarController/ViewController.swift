//
//  ViewController.swift
//  DYTabBarController
//
//  Created by darren on 16/8/11.
//  Copyright © 2016年 flashword. All rights reserved.
//

import UIKit

class ViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bounds = self.view.bounds
        let tabbar = DYColorTab(frame:CGRect(x: 0, y: bounds.height-55, width:bounds.size.width, height:55))
        tabbar.userInteractionEnabled = true
        tabbar.dataSource = self
        self.view.addSubview(tabbar)
        tabbar.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


extension ViewController : DYColorTabDataSource {
    func numberOfItems(inTabSwitcher tabSwitcher: DYColorTab) -> Int {
        return 4
    }
    func tabSwitcher(tabSwitcher: DYColorTab, titleAt index: Int) -> String {
        return "Index \(index)"
    }
    func tabSwitcher(tabSwitcher: DYColorTab, iconAt index: Int) -> UIImage {
        return UIImage(named: "\(index)_normal")!
    }
    func tabSwitcher(tabSwitcher: DYColorTab, hightlightedIconAt index: Int) -> UIImage {
        return UIImage(named: "\(index)_highlighted")!
    }
    func tabSwitcher(tabSwitcher: DYColorTab, tintColorAt index: Int) -> UIColor {
        let colors = [UIColor.brownColor(), UIColor.cyanColor(), UIColor.magentaColor(), UIColor.purpleColor(), UIColor.orangeColor()]
        return colors[index]
    }
}
