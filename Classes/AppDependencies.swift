//
//  AppDependencies.swift
//  iTunes Albums VIPER
//
//  Created by Alexey Kuchmiy on 11/23/15.
//  Copyright © 2015 Alexey Kuchmiy. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies {
    var listWireframe = ListWireframe()
    
    init() {
        configureDependencies()
    }
    
    func installRootViewControllerIntoWindow(window: UIWindow) {
        listWireframe.presentListInterfaceFromWindow(window)
    }
    
    func configureDependencies() {
        let rootWireframe = RootWireframe()
        let serverApi = ServerApi()
        
        let listPresenter = ListPresenter()
        let listDataManager = ListDataManager()
        let listInteractor = ListInteractor(dataManager: listDataManager, serverApi: serverApi)

        let detailsWireframe = DetailsWireframe()
        let detailsInteractor = DetailsInteractor()
        let detailsPresenter = DetailsPresenter()
        
        listInteractor.output = listPresenter

        listPresenter.listInteractor = listInteractor
        listPresenter.listWireframe = listWireframe

        listWireframe.detailsWireframe = detailsWireframe
        listWireframe.listPresenter = listPresenter
        listWireframe.rootWireframe = rootWireframe
        
        detailsWireframe.detailsPresenter = detailsPresenter
        detailsPresenter.detailsWireframe = detailsWireframe
        detailsPresenter.detailsInteractor = detailsInteractor
    }
}