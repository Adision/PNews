//
//  PTabBarController.swift
//  PNews
//
//  Created by os on 2019/7/29.
//  Copyright © 2019 os. All rights reserved.
//

import UIKit

class PTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tabbar = UITabBar.appearance()
        tabbar.tintColor = UIColor(red: 245/255.0, green: 90/255.0, blue: 93/255.0, alpha: 1.0)
        
        addChildViewControllers()
        
    }

    func addChildViewControllers(){
        setChildViewController(HomeViewController(), title: "首页", imageName: "home_tabbar_32x32_", selectedImageName: "home_tabbar_press_32x32_")
        setChildViewController(VideoViewController(), title: "视频", imageName: "video_tabbar_32x32_", selectedImageName: "video_tabbar_press_32x32_")
        setChildViewController(HSViewController(), title: "火山", imageName: "huoshan_tabbar_32x32_", selectedImageName: "huoshan_tabbar_press_32x32_")
        setChildViewController(MeViewController(), title: "我的", imageName: "mine_tabbar_32x32_", selectedImageName: "mine_tabbar_press_32x32_")
        
        //tabBar 是 readonly属性，不能直接修改，利用KVC把readonly属性的权限改过来
        setValue(PTabBar(), forKey: "tabBar")
    }
    
    //初始化子控制器
    func setChildViewController(_ childController:UIViewController, title:String, imageName:String ,selectedImageName:String){
        childController.tabBarItem.image = UIImage(named:imageName)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        childController.title = title
        
        let navVC = PNavigationController(rootViewController:childController)
        addChild(navVC)
        
    }

}
