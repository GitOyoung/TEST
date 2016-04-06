//
//  RatingViewcontroller.swift
//  GitLearn
//
//  Created by Qingke on 16/4/5.
//  Copyright © 2016年 Qingke. All rights reserved.
//

import UIKit

class RatingViewcontroller: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        for i in 0...5{
            let button = UIButton(frame: CGRect(x: i * (40 + 5), y: 0, width: 40, height: 40  ))
            button.backgroundColor = UIColor.redColor()
            addSubview(button)
            button.addTarget(self, action: "ratingControlTap", forControlEvents: .TouchDown)
        }
    }
    func ratingControlTap(){
        print( "按钮点击成功")
        
    }
    
    override func intrinsicContentSize() -> CGSize {
        super.intrinsicContentSize()
        return CGSize(width: 240, height: 40)
    }
    
}
