//
//  RatingViewcontroller.swift
//  GitLearn
//
//  Created by Qingke on 16/4/5.
//  Copyright © 2016年 Qingke. All rights reserved.
//

import UIKit

class RatingView: UIView {

    var buttons: [UIButton] = []
    var buttonWidth: CGFloat = 40
    var buttonHeight: CGFloat = 40
    var buttonSpace: CGFloat = 5
    var starNumber: Int = 5
    var rating: Int = 0 {
        didSet {
            if oldValue != rating {
                updateStar()
            }
        }
    }
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        let emptyStar = UIImage(named: "emptyStar")
        let fillStar = UIImage(named: "fillStar")
        
        
        for i in 0..<starNumber{
            let button = UIButton()
//            button.backgroundColor = UIColor.redColor()
            button.addTarget(self, action: "ratingControlTap:", forControlEvents: .TouchDown)
            
            button.setBackgroundImage(emptyStar, forState: .Normal)
            button.setBackgroundImage(fillStar, forState: .Selected)
            button.setBackgroundImage(fillStar, forState: [.Highlighted,.Selected])

            
            buttons += [button]
            
            addSubview(button)
            button.tag = i
        }
    }
    func ratingControlTap(button: UIButton){
        print( "按钮点击成功")
        rating = button.tag + 1
    }
    func updateStar(){
        for button in buttons {
            if button.tag < rating {
                button.selected = true
            } else {
                button.selected = false
            }
        }
    }
    override func layoutSubviews() {
        print("layoutSubviews")
        var frame = CGRect(x: 0, y: 0, width: buttonWidth, height: buttonHeight)
        for button in buttons {                                                         //for (index,button) in buttons.enumerate() 有index的时候就是需要枚举这个方法来索引出来，
                                                                                        // 若不用知道其index 则不需要.enumerate
            button.frame = frame
            frame.origin.x += (buttonHeight + buttonSpace)
            
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        super.intrinsicContentSize()
        return CGSize(width: CGFloat(starNumber) * (buttonHeight + buttonSpace) - buttonSpace, height: buttonHeight)
    }
}
