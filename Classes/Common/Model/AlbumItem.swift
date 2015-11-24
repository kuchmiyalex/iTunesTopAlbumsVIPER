//
//  AlbumItem.swift
//  iTunes Albums VIPER
//
//  Created by Alexey Kuchmiy on 11/23/15.
//  Copyright © 2015 Alexey Kuchmiy. All rights reserved.
//

import UIKit

class AlbumItem: NSObject {

    var name = ""
    var artist = ""
    var title = ""
    var cover = ""
    var desc = ""
    var purchaseLink = ""
    
    override init() {
        super.init()
    }
    
    convenience init(inputJson: JSON)
    {
        self.init()
        title = inputJson["title"]["label"].string ?? ""
        artist = inputJson["im:artist"]["label"].string ?? ""
        name = inputJson["im:name"]["label"].string ?? ""
        
        if let imageArray = inputJson["im:image"].arrayValue.first
        {
            cover = imageArray["label"].stringValue
        }
    
        
        let price = inputJson["im:price"]["label"].string ?? ""
        let releaseDate = inputJson["im:releaseDate"]["attributes"]["label"].string ?? ""
        purchaseLink = inputJson["id"]["label"].string ?? ""

        desc = "\(title)\n\(price)\n\(releaseDate)"
    }
}
