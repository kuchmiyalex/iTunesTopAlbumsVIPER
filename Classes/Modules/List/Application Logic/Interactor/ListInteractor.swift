//
//  ListInteractor.swift
//  iTunes Albums VIPER
//
//  Created by Alexey Kuchmiy on 11/23/15.
//  Copyright © 2015 Alexey Kuchmiy. All rights reserved.
//

import UIKit

class ListInteractor: NSObject, ListInteractorInput {
    var output : ListInteractorOutput?
    let dataManager : ListDataManager
    let serverApi: ServerApi?
    
    init(dataManager: ListDataManager, serverApi: ServerApi) {
        self.dataManager = dataManager
        self.serverApi = serverApi
    }

    func loadAlbums()
    {
        serverApi?.getTopAlbums(maxCount: Constants.AlbumsCount, completionHandler: { (items, error) -> Void in
            let sorted = self.dataManager.albumsSortedByName(items)
            self.output?.loadedAlbums(sorted, error: error)
        })
    }
}
