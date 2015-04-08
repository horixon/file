//
//  GZipTests.swift
//  GZipTests
//
//  Created by justin on 4/7/15.
//  Copyright (c) 2015 Electroreef. All rights reserved.
//

import UIKit
import XCTest
import File
import GZip

class GZipTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEasyGzip()
    {
        let testData:String = "teststestetaetestsetsetsetstestst6estetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetstetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetstehststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsethsteststestehtaetestsetsetsetstheststestetaetestsetsetfsetsteststestetaetesftsetsetsetsteststestetaetestsetsetsetsteststestetae5testsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetae4testsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetajetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetstestst9estetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetstes3tstestetaetestsetsetsetsteststestetaetes6tsetsetsetsteststestetaetestsetsetsetstesrtstestetaetestsetsetsetsteststyestetaetest4setsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsets9etsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsy3etsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetstestste3stetaetestsetsetsetsteststestetaetestsetsetbsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsetsteststestetaetestsetsetsets"
        
        let url = directoryurl(NSSearchPathDirectory.DocumentDirectory, "gtest4")
        
        let data = testData.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        
        println("dataLength: \(data.length)")
        
        gzip(url!, data);
        
        let uncompressedData = unGZip(url!)
        
        let answer:String = NSString(data: uncompressedData!, encoding: NSUTF8StringEncoding)!
        
        let result = answer == testData
        
        XCTAssertTrue(result)
    }
    
}
