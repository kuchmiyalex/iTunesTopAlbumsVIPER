//
//  ListVC.swift
//  iTunes Albums VIPER
//
//  Created by Alexey Kuchmiy on 11/23/15.
//  Copyright © 2015 Alexey Kuchmiy. All rights reserved.
//

import UIKit

class ListVC: UIViewController, ListViewInterface, UIScrollViewDelegate {
    var eventHandler : ListModuleInterface?
    
    @IBOutlet var actView: UIActivityIndicatorView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var txtInfo: UITextView!
    @IBOutlet var scroll: UIScrollView!
    @IBOutlet var butNext: UIButton!
    
    var pageViews = [RemoteImageView]()
    
    var userScrolling = false
    var userChangedPageControl = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        eventHandler?.updateView()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "appLaunched", name: UIApplicationDidBecomeActiveNotification, object: nil)

    }

    func appLaunched()
    {
        eventHandler?.updateView()
    }
    
    func configureView() {
        navigationItem.title = "Top Albums"
        txtInfo.text = ""
    }

    
    func showNoContentMessage() {
        butNext.enabled = false
        showAlert("Oops", message: "No content available")
    }
    
    func prefferedImageSize() -> CGSize {
        return scroll.bounds.size
    }

    @IBAction func nextPressed(sender: AnyObject) {
        eventHandler?.showAlbumDetailsPage()
    }
    
    
    @IBAction func pageControlPressed(sender: AnyObject) {
        userChangedPageControl = true
        eventHandler?.changePage(pageControl.currentPage)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
            Int64(0.2 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
                self.userChangedPageControl = false
        }

    }

    func showAlbumAtIndex(pageIndex: NSInteger?, album: AlbumDisplayItem?)
    {
        if pageIndex != nil
        {
            if !userChangedPageControl {
                pageControl.currentPage = pageIndex!
            }
            
            if !userScrolling {
                scroll.setContentOffset(CGPointMake(CGFloat(pageIndex!) * scroll.bounds.size.width, scroll.contentOffset.y), animated: true)
            }
        }
        
        if album != nil
        {
            self.txtInfo.text = album?.title
        }
    }
    
    func showNoContentErrorMessage(message: String) {
        showWarningAlert(message)
        butNext.enabled = false
    }
    
    func showItemsData(data: AlbumsDisplayData) {
        butNext.enabled = true
        pageControl.numberOfPages = data.items.count
        pageViews.forEach {
            $0.removeFromSuperview()
        }
        pageViews.removeAll()
        
        var maxX:CGFloat = 0
        for (idx, item) in data.items.enumerate()
        {
            let rv = RemoteImageView()
            rv.imageURLString = item.coverUrl
            rv.frame = scroll.bounds
            var r = rv.frame
            r.origin.x = CGFloat(idx) * scroll.bounds.size.width
            rv.frame = r
            scroll.addSubview(rv)
            pageViews += [rv]
            maxX = CGRectGetMaxX(r)
        }
        eventHandler?.changePage(0)
        scroll.contentSize = CGSizeMake(maxX, scroll.contentSize.height)
    }
    
    func showLoading(loading: Bool) {
        switch loading
        {
            case true: actView.startAnimating()
            case false: actView.stopAnimating()
        }
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let page = Int((scrollView.contentOffset.x + scrollView.frame.size.width/2) / scrollView.frame.size.width);
        if page != pageControl.currentPage && !userChangedPageControl
        {
            userScrolling = true
            eventHandler?.changePage(page)
            userScrolling = false
        }
    }

}
