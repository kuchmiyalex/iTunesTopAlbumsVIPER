//
//  ListPresenter.swift
//  iTunes Albums VIPER
//
//  Created by Alexey Kuchmiy on 11/23/15.
//  Copyright © 2015 Alexey Kuchmiy. All rights reserved.
//

import UIKit

class ListPresenter: NSObject, ListModuleInterface, ListInteractorOutput  {
    var listInteractor : ListInteractorInput?
    var listWireframe : ListWireframe?
    var userInterface : ListViewInterface?
    var dataObject: AlbumsDisplayData?
    var currentPage: NSInteger = 0
    
    override init() {
        super.init()
    }
    
    func loadedAlbums(albums: [AlbumItem], error: NSError?) {
        userInterface?.showLoading(false)
        if error != nil {
            userInterface?.showNoContentErrorMessage(error!.localizedDescription)
            return
        }
        
        if albums.isEmpty
        {
            userInterface?.showNoContentMessage()
        }
        else
        {
            updateUserInterfaceWithAlbums(albums)
        }
    }
    
    func requestContent() {
        if dataObject != nil
        {
            return
        }
        userInterface?.showLoading(true)
        listInteractor?.loadAlbums()
    }
    
    func showAlbumDetailsPage() {
        let displayItem = dataObject?.items[currentPage]
        listWireframe?.presentDetailsInterface(displayItem!)
    }
    
    func updateView() {
        requestContent()
    }
    
    func changePage(newPage: NSInteger) {
        let displayItem = dataObject?.items[newPage]
        currentPage = newPage
        userInterface?.showAlbumAtIndex(newPage, album: displayItem)
    }
    
    func updateUserInterfaceWithAlbums(albums: [AlbumItem])
    {
        dataObject = listDisplayDataForAlbums(albums)
        userInterface?.showItemsData(dataObject!)
    }

    func listDisplayDataForAlbums(albums: [AlbumItem]) -> AlbumsDisplayData
    {
        var displayItems = [AlbumDisplayItem]()
        albums.forEach() {
            displayItems += [AlbumDisplayItem(model: $0, prefferedImageSize: userInterface?.prefferedImageSize())]
        }
        return AlbumsDisplayData(items: displayItems)
    }
}
