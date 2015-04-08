//
//  File.swift
//  Persona
//
//  Created by justin on 4/7/15.
//  Copyright (c) 2015 Electroreef. All rights reserved.
//

import Foundation

public func directoryurl(directory:NSSearchPathDirectory, pathcomponent:String) -> NSURL? {
    if let filepath = NSFileManager.defaultManager().URLForDirectory(directory,inDomain:NSSearchPathDomainMask.UserDomainMask,appropriateForURL:nil,create:true, error:nil)
    {
        
        return NSURL(string: pathcomponent,relativeToURL:filepath)
    }
    
    return .None;
}

public func filehandle(path:NSURL, error:NSErrorPointer) -> NSFileHandle {
    let fm = NSFileManager.defaultManager()
    let strpath = path.path!
    
    if !fm.fileExistsAtPath(strpath)
    {
        let content = "".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        fm.createFileAtPath(strpath, contents: content, attributes: nil)
    }
    
    return NSFileHandle(forUpdatingURL:path.fileReferenceURL()!, error: error)!
}

public func append( fh:NSFileHandle, d:NSData){
    fh.seekToEndOfFile()
    fh.writeData(d)
}

public func append(fh:NSFileHandle, d:String){
    append(fh, d.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion:false)!)
}