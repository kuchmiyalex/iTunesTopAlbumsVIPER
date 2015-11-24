//
//  AlbumDisplayItem.swift
//  iTunes Albums VIPER
//
//  Created by Alexey Kuchmiy on 11/23/15.
//  Copyright © 2015 Alexey Kuchmiy. All rights reserved.
//

import UIKit

struct AlbumDisplayItem {
    var title : String = ""
    var desc : String = ""
    var coverUrl : String = ""
    var purchaseLink : String = ""
    
    
    init(model: AlbumItem, prefferedImageSize: CGSize?)
    {
        self.title = model.title
        self.desc = model.desc
        self.coverUrl = model.cover
        self.purchaseLink = model.purchaseLink
        
        if prefferedImageSize != nil
        {
            let maxSize = Int(max(prefferedImageSize!.height, prefferedImageSize!.width))
            self.coverUrl = model.cover.stringByReplacingOccurrencesOfString("55x55", withString: "\(maxSize)x\(maxSize)")
        }
    }
}
