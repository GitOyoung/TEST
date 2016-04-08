//
//  modelText.swift
//  GitLearn
//
//  Created by Qingke on 16/4/6.
//  Copyright © 2016年 Qingke. All rights reserved.
//

import UIKit
class Beauty {
    var name: String
    var photo: UIImage?
    var rating: Int
    init?(name:String,photo:UIImage?,rating:Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        if rating < 0 || name.isEmpty {
            return nil
        }
    }
    
}
