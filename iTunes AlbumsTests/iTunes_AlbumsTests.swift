//
//  iTunes_AlbumsTests.swift
//  iTunes AlbumsTests
//
//  Created by Alexey Kuchmiy on 11/24/15.
//  Copyright © 2015 Alexey Kuchmiy. All rights reserved.
//

import XCTest
@testable import iTunes_Albums

class iTunes_AlbumsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testServerApiResponseError()
    {
        let parsedArray = ServerApi().jsonArrayFromData(nil)
        assert(parsedArray == nil)
    }

    func testServerApiResponseSuccess()
    {
        self.measureBlock { () -> Void in
            let sampleResponseFP = NSBundle.mainBundle().pathForResource("sampleJSONResponse", ofType: nil)
            let data = NSData(contentsOfFile: sampleResponseFP!)
            let parsedArray = ServerApi().jsonArrayFromData(data)
            let parsedItems = ServerApi().albumItemsFromJSON(parsedArray!)
            assert(!parsedItems.isEmpty)
        }
    }

    func testServerApi()
    {
        let expectation = expectationWithDescription("Request should complete within a certain timeframe")

        ServerApi().getTopAlbums(maxCount: 20) { (items, error) -> Void in
            assert(!items.isEmpty && error == nil)
            expectation.fulfill()
        }
        
        let expectedMaxTimeout: NSTimeInterval = 3
        waitForExpectationsWithTimeout(expectedMaxTimeout) { (error) -> Void in
            if error != nil {
                print("Timeout Error: \(error)")
            }
            assert(error == nil)
        }
    }

    func testServerApiError()
    {
        let expectation = expectationWithDescription("Request should complete within a certain timeframe")
        
        ServerApi().getTopAlbums(maxCount: 20000) { (items, error) -> Void in
            XCTAssertTrue(items.isEmpty)
            XCTAssertNotNil(error, "Simulated error")
            expectation.fulfill()
        }
        
        let expectedMaxTimeout: NSTimeInterval = 3
        waitForExpectationsWithTimeout(expectedMaxTimeout) { (error) -> Void in
            if error != nil {
                print("Timeout Error: \(error)")
            }
            assert(error == nil)
        }
    }

    
    func testAlbumItemFromEmptyJSON()
    {
        let albumItem = AlbumItem(inputJson: JSON(""))
        assert(albumItem.title.isEmpty)
        assert(albumItem.name.isEmpty)
        assert(albumItem.artist.isEmpty)
        assert(albumItem.desc == "\n\n")
        assert(albumItem.purchaseLink.isEmpty)
    }
}
