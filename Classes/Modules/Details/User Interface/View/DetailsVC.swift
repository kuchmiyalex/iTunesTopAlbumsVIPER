//
//  DetailsVC.swift
//  iTunes Albums VIPER
//
//  Created by Alexey Kuchmiy on 11/23/15.
//  Copyright © 2015 Alexey Kuchmiy. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController, DetailsViewInterface, UIScrollViewDelegate {
    var eventHandler : DetailsModuleInterface?
    
    @IBOutlet var cover: RemoteImageView!
    @IBOutlet var txtInfo: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        eventHandler?.updateView()
    }

    func showAlbumItem(item: AlbumDisplayItem) {
        txtInfo.text = item.desc
        cover.imageURLString = item.coverUrl
    }
    
    func configureView() {
        navigationItem.title = "Album Details"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "BUY", style: .Plain, target: self, action: "purchasePressed")
    }

    func purchasePressed() {
        eventHandler?.purchasePressed()
    }

}
