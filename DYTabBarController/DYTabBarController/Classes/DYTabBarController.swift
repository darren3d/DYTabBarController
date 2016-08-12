//
//  DYTabBarController.swift
//  DYTabBarController
//
//  Created by darren on 16/8/12.
//  Copyright © 2016年 flashword. All rights reserved.
//

import UIKit

class DYTabBarController: UITabBarController {
    private(set) lazy var colorTab : DYColorTab = {
        let colorTab = DYColorTab(frame: self.tabBar.bounds)
        colorTab.userInteractionEnabled = true
        colorTab.dataSource = self
        return colorTab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.addSubview(colorTab)
        
        colorTab.addTarget(self, action: #selector(onColorTabChanged(_:)), forControlEvents:.ValueChanged)
        
        setViewControllers(self.viewControllers, animated: false)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        emptyTabBarSubViews()
    }
    
    private func emptyTabBarSubViews() {
        for subView in self.tabBar.subviews {
            if let control = subView as? UIControl {
                if control != colorTab {
                    control.removeFromSuperview()
                }
            }
        }
    }
    
    @objc func onColorTabChanged(sender: DYColorTab) {
        if selectedIndex != sender.selectedSegmentIndex  {
            self.selectedIndex = sender.selectedSegmentIndex
        }
    }
    
    override var selectedIndex: Int {
        didSet {
            if selectedIndex != colorTab.selectedSegmentIndex {
                colorTab.selectedSegmentIndex = selectedIndex
            }
        }
    }
    
    override var viewControllers: [UIViewController]? {
        get {
            return self.childViewControllers
        }
        set {
            setViewControllers(newValue, animated: false)
        }
    }
    
    override func setViewControllers(viewControllers: [UIViewController]?, animated: Bool) {
        guard let viewControllers = viewControllers else {
            return
        }
        
        for childController in viewControllers {
            childController.removeFromParentViewController()
            childController.view.removeFromSuperview()
            
            self.addChildViewController(childController)
        }
        
        colorTab.reloadData()
    }
}


extension DYTabBarController : DYColorTabDataSource {
    func numberOfItems(inTabSwitcher tabSwitcher: DYColorTab) -> Int {
        return self.childViewControllers.count
    }
    
    func tabSwitcher(tabSwitcher: DYColorTab, titleAt index: Int) -> String {
        guard let title = self.childViewControllers[index].tabBarItem.title else {
            return ""
        }
        return title
    }
    
    func tabSwitcher(tabSwitcher: DYColorTab, iconAt index: Int) -> UIImage {
        guard let image = self.childViewControllers[index].tabBarItem.image else {
            return UIImage()
        }
        return image
    }
    
    func tabSwitcher(tabSwitcher: DYColorTab, hightlightedIconAt index: Int) -> UIImage {
        guard let image = self.childViewControllers[index].tabBarItem.selectedImage else {
            return UIImage()
        }
        return image
    }
    
    func tabSwitcher(tabSwitcher: DYColorTab, tintColorAt index: Int) -> UIColor {
        let colors = [UIColor.brownColor(), UIColor.cyanColor(), UIColor.magentaColor(), UIColor.purpleColor(), UIColor.orangeColor()]
        return colors[index]
    }
}