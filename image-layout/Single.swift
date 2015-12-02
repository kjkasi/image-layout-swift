//
//  Single.swift
//  image-layout
//
//  Created by Anton Minin on 01.12.15.
//  Copyright © 2015 Anton Minin. All rights reserved.
//

import Foundation
import CoreGraphics

func singleLayout(elements: [Image]/*[(height: Float, width: Float)]*/, maxHeight: CGFloat, containerWidth: CGFloat) -> CGSize {
    
    let el = elements[0]
    
    var scale: CGFloat = 1.0
    
    if (maxHeight < el.width * scale) {
        scale = maxHeight / el.width
    }
    
    if (containerWidth < el.height * scale) {
        scale *= containerWidth / (scale * el.height)
    }
    
    let height = el.height * scale
    let width = el.width * scale
    
    return CGSize(width: width, height: height)
}