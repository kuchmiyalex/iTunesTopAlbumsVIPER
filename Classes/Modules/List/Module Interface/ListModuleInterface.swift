//
//  ListModuleInterface.swift
//  iTunes Albums VIPER
//
//  Created by Alexey Kuchmiy on 11/23/15.
//  Copyright © 2015 Alexey Kuchmiy. All rights reserved.
//

import Foundation

protocol ListModuleInterface {
    func requestContent()
    func updateView()
    func changePage(newPage: Int)
    
    func showAlbumDetailsPage()
}
