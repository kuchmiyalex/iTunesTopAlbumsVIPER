//
//  AlbumsDisplayData.swift
//  iTunes Albums VIPER
//
//  Created by Alexey Kuchmiy on 11/23/15.
//  Copyright © 2015 Alexey Kuchmiy. All rights reserved.
//

import Foundation

struct AlbumsDisplayData {
    var items = [AlbumDisplayItem]()
    
    init(items: [AlbumDisplayItem])
    {
        self.items = items
    }
    
}
