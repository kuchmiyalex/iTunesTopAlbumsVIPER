//
//  DetailsPresenter.swift
//  iTunes Albums VIPER
//
//  Created by Alexey Kuchmiy on 11/23/15.
//  Copyright © 2015 Alexey Kuchmiy. All rights reserved.
//

import UIKit

class DetailsPresenter: NSObject, DetailsModuleInterface  {
    var detailsInteractor : DetailsInteractor?
    var detailsWireframe : DetailsWireframe?
    var userInterface : DetailsViewInterface?
    var dataObject: AlbumDisplayItem!

    func updateView() {
        userInterface?.showAlbumItem(dataObject)
    }
 
    func purchasePressed() {
        UIApplication.sharedApplication().openURL(NSURL(string: dataObject.purchaseLink)!)
    }
}
