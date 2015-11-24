//
//  ListViewInterface.swift
//  iTunes Albums VIPER
//
//  Created by Alexey Kuchmiy on 11/23/15.
//  Copyright © 2015 Alexey Kuchmiy. All rights reserved.
//

import Foundation

protocol ListViewInterface {
    func showNoContentMessage()
    func showNoContentErrorMessage(message: String)
    func showItemsData(data: AlbumsDisplayData)
    func showLoading(loading: Bool)
    func showAlbumAtIndex(pageIndex: NSInteger?, album: AlbumDisplayItem?)
    
    
    func prefferedImageSize() -> CGSize
}