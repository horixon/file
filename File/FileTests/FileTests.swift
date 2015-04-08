//
//  FileIOTests.swift
//  Creep
//
//  Created by justiwag on 9/22/14.
//  Copyright (c) 2015 Electroreef. All rights reserved.
//

import UIKit
import XCTest
import File

class FileIOTests: XCTestCase {

    private var docUrl:NSURL!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.docUrl = directoryurl(NSSearchPathDirectory.DocumentDirectory,"fileIOTests.txt");
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        if let frURL = self.docUrl.fileReferenceURL()
        {
            NSFileManager.defaultManager().removeItemAtURL(frURL, error: nil)
        }
        super.tearDown()
    }
    
    func fileToString(fileHandle:NSFileHandle) -> String? {
        fileHandle.seekToFileOffset(0)
        return NSString(data: fileHandle.readDataToEndOfFile(), encoding: NSUTF8StringEncoding)
    }
    
    func testExample() {
        let str =  "as.dfmadsf"
        let testContent = str.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)

        let fh = filehandle(self.docUrl!, nil)
        
        append(fh,testContent!)
        
        var answer = fileToString(fh)
        
        XCTAssertTrue(answer == str)
        
        append(fh,str)
        
        answer = fileToString(fh);
        
        XCTAssertTrue(answer == str.stringByAppendingString(str));
    }
    
    func testAddDirectoryAndItDoesntBlowOutDir() {
        let url = directoryurl(NSSearchPathDirectory.DocumentationDirectory,"locations/test")
        
        XCTAssertTrue(url!.path!.hasSuffix("Library/Documentation/locations/test"))
        
        let dirUrl = directoryurl(NSSearchPathDirectory.DocumentationDirectory, "locations")
        
        NSFileManager.defaultManager().createDirectoryAtURL(dirUrl!, withIntermediateDirectories: true, attributes: nil, error: nil)
        
        "test".writeToURL(url!, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
        
        
        NSFileManager.defaultManager().createDirectoryAtURL(dirUrl!, withIntermediateDirectories: true, attributes: nil, error: nil)
        
        let fh = filehandle(url!, nil)
        let answer = fileToString(fh)
        
        XCTAssertTrue(answer == "test")
        
    }
}
