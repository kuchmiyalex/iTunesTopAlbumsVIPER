//
//  ListDataManager.swift
//  iTunes Albums VIPER
//
//  Created by Alexey Kuchmiy on 11/23/15.
//  Copyright © 2015 Alexey Kuchmiy. All rights reserved.
//

import UIKit

class ListDataManager: NSObject {

    func albumsSortedByName(albums: [AlbumItem]) -> [AlbumItem]
    {
        return albums.sort() {$0.title < $1.title}
    }
}
