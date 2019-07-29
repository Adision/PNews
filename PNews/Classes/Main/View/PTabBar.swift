//
//  PTabBar.swift
//  PNews
//
//  Created by os on 2019/7/29.
//  Copyright © 2019 os. All rights reserved.
//

import UIKit

class PTabBar: UITabBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(publishButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //private 绝对私有
    //fileprivate 文件私有，可以在当前文件中访问
    //懒加载
    private lazy var publishButton: UIButton = {
        let publishButton = UIButton(type: .custom)
        publishButton.setBackgroundImage(UIImage(named: "feed_publish_44x44_"), for: .normal)
        publishButton.setBackgroundImage(UIImage(named: "feed_publish_night_44x44_"), for: .selected)
        publishButton.sizeToFit()
        return publishButton
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //当前tabbar的高度和宽度
        let width = frame.width
        let height = frame.height
        
        publishButton.center = CGPoint(x: width * 0.5, y: height * 0.5 - 10)
        
        //设置其它按钮 frame
        let buttonW: CGFloat = width * 0.2
        let buttonH: CGFloat = height
        let buttonY: CGFloat = 0
        
        var index = 0
        for button in subviews {
            if !button.isKind(of: NSClassFromString("UITabBarButton")!){ continue }
            
            let buttonX = buttonW * (index > 1 ? CGFloat(index + 1) : CGFloat(index))
            button.frame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonH)
            index += 1
        }
    }

}
