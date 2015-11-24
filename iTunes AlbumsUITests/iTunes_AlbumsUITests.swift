//
//  iTunes_AlbumsUITests.swift
//  iTunes AlbumsUITests
//
//  Created by Alexey Kuchmiy on 11/24/15.
//  Copyright © 2015 Alexey Kuchmiy. All rights reserved.
//

import XCTest

class iTunes_AlbumsUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNavigationBetweenPages() {
        let app = XCUIApplication()
        let page1Of15PageIndicator = app.pageIndicators["page 1 of 15"]
        page1Of15PageIndicator.tap()
        page1Of15PageIndicator.tap()
        
        let albumDescriptionTextView = app.textViews["Album description"]
        albumDescriptionTextView.tap()
        
        let nextButton = app.buttons["NEXT"]
        nextButton.tap()
        albumDescriptionTextView.tap()
        albumDescriptionTextView.tap()
        albumDescriptionTextView.tap()
        
        let albumDetailsNavigationBar = app.navigationBars["Album Details"]
        albumDetailsNavigationBar.buttons["Top Albums"].tap()
        nextButton.tap()
        albumDetailsNavigationBar.buttons["BUY"].tap()
    }
}
