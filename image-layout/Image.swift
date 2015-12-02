//
//  Image.swift
//  image-layout
//
//  Created by Anton Minin on 02.12.15.
//  Copyright © 2015 Anton Minin. All rights reserved.
//

import UIKit

class Image: NSObject {
    var width: CGFloat = 0
    var height: CGFloat = 0
    func resize(bounds: CGSize) -> CGSize {
        
        return singleLayout([self], maxHeight: bounds.height, containerWidth: bounds.width)
    }
}
