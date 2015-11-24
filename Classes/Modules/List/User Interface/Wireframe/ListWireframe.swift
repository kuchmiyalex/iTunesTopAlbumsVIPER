//
//  ListWireframe.swift
//  iTunes Albums VIPER
//
//  Created by Alexey Kuchmiy on 11/23/15.
//  Copyright © 2015 Alexey Kuchmiy. All rights reserved.
//

import UIKit

let ListViewControllerIdentifier = "ListVC"

class ListWireframe: NSObject {

    var detailsWireframe : DetailsWireframe?
    var listPresenter : ListPresenter?
    var rootWireframe : RootWireframe?
    var listViewController : ListVC?
    
    func presentListInterfaceFromWindow(window: UIWindow) {
        let viewController = listViewControllerFromStoryboard()
        viewController.eventHandler = listPresenter
        listViewController = viewController
        listPresenter!.userInterface = viewController
        rootWireframe?.showRootViewController(viewController, inWindow: window)
    }
    
    func presentDetailsInterface(album: AlbumDisplayItem) {
        detailsWireframe?.presentDetailsInterfaceFromViewController(listViewController!, album: album)
    }
    
    func listViewControllerFromStoryboard() -> ListVC {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(ListViewControllerIdentifier) as! ListVC
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }

}
