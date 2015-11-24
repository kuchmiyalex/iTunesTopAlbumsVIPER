//
//  ServerApi.swift
//  iTunes Albums VIPER
//
//  Created by Alexey Kuchmiy on 11/23/15.
//  Copyright © 2015 Alexey Kuchmiy. All rights reserved.
//

import UIKit

let AlbumsTopEndpoint = "https://itunes.apple.com/us/rss/topalbums/limit=%i/json"

class ServerApi: NSObject {

    func getTopAlbums(maxCount limit: Int, completionHandler: ([AlbumItem]!, NSError?) -> Void) -> Void
    {
        let requestString = AlbumsTopEndpoint.stringByReplacingOccurrencesOfString("%i", withString: "\(limit)")
        let url: NSURL = NSURL(string: requestString)!
        let ses = NSURLSession.sharedSession()
        let task = ses.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            if (error != nil) {
                dispatch_async(dispatch_get_main_queue(),{
                    completionHandler([], error)
                })
                return
            }

            if let resultsArray = self.jsonArrayFromData(data)
            {
                let newItems = self.albumItemsFromJSON(resultsArray)
                dispatch_async(dispatch_get_main_queue(),{
                    completionHandler(newItems, nil)
                })
            }
            else
            {
                dispatch_async(dispatch_get_main_queue(),{
                    completionHandler([], NSError(domain: "local", code: 400, userInfo: [NSLocalizedDescriptionKey: "Failed parsing remote content"]))
                })
            }
        })
        task.resume()
    }
    
    
    func jsonArrayFromData(data: NSData?) -> [JSON]?
    {
        if data == nil { return nil }
        let json = JSON(data: data!)
        return json["feed"]["entry"].array
    }
    
    func albumItemsFromJSON(jsonArray: [JSON]) -> [AlbumItem]
    {
        var items = [AlbumItem]()
        for json in jsonArray
        {
            let albumModel = AlbumItem(inputJson: json)
            items += [albumModel]
        }
        return items
    }
}
