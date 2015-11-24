//
//  ListWireframe.swift
//  iTunes Albums VIPER
//
//  Created by Alexey Kuchmiy on 11/23/15.
//  Copyright © 2015 Alexey Kuchmiy. All rights reserved.
//

import UIKit

let DetailsViewControllerIdentifier = "DetailsVC"

class DetailsWireframe: NSObject {

    var detailsPresenter : DetailsPresenter?
    var presentedViewController : UIViewController?

    func presentDetailsInterfaceFromViewController(viewController: UIViewController, album: AlbumDisplayItem) {
        let newViewController = detailsViewControllerFromStoryboard()
        detailsPresenter?.dataObject = album
        detailsPresenter?.userInterface = newViewController
        newViewController.eventHandler = detailsPresenter
        viewController.navigationController?.pushViewController(newViewController, animated: true)
        
        presentedViewController = viewController
    }
    
    func dismissDetailsInterface() {
        presentedViewController?.navigationController?.popViewControllerAnimated(true)
    }

    func detailsViewControllerFromStoryboard() -> DetailsVC {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(DetailsViewControllerIdentifier) as! DetailsVC
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }

}
