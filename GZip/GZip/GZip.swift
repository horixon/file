//
//  GZip.swift
//  GZip
//
//  Created by justin on 4/7/15.
//  Copyright (c) 2015 Electroreef. All rights reserved.
//

import libz

public func gzip(url:NSURL,data:NSData) -> Bool {
    if let path = url.path
    {
        var file = gzopen(path,"w")
            
        if file != nil{
            gzsetparams(file, 7, Z_DEFAULT_STRATEGY)
            gzbuffer(file, 18000)
            let uncompressedBytesWritten = gzwrite(file, data.bytes, UInt32(data.length))
                
            if gzclose_w(file) != Z_OK
            {
                return false
            }
        }
            
        return true
    }
        
    return false
}
    
public func unGZip(url:NSURL) -> NSData? {
    if let path = url.path {
            
        if let fileAttributes = NSFileManager.defaultManager().attributesOfItemAtPath(path, error: nil){
                
            if let readLength:Int = fileAttributes[NSFileSize] as? Int {
                    
                var file = gzopen(url.path!,"r")
                    
                if file != nil {
                    if let buffer = NSMutableData(length:readLength) {
                            
                        let fileData = NSMutableData()
                            
                        let rl = (readLength > 0 ? UInt(readLength) : 0) <= UInt(UInt32.max) ? UInt32(readLength) : UInt32.max
                            
                        var readBytes = Int(gzread(file, buffer.mutableBytes, rl))
                        fileData.appendBytes(buffer.mutableBytes, length: readBytes)

                        while readBytes >= readLength {
                            readBytes = Int(gzread(file, buffer.mutableBytes, rl))
                        
                            fileData.appendBytes(buffer.mutableBytes, length: readBytes)
                        }
                            
                        gzclose(file)
                            
                        if readBytes == -1 {
                            return .None
                        }
                        else {
                            return fileData
                        }
                    }
                }
            }
        }
    }
        
    return .None
}