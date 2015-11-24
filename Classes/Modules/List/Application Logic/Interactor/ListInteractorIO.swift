//
//  ListInteractorIO.swift
//  iTunes Albums VIPER
//
//  Created by Alexey Kuchmiy on 11/23/15.
//  Copyright © 2015 Alexey Kuchmiy. All rights reserved.
//

import UIKit

protocol ListInteractorInput {
    func loadAlbums()
}

protocol ListInteractorOutput {
    func loadedAlbums(albums : [AlbumItem], error: NSError?)
}
