//
//  Extensions.swift
//  Lion Card App (3)
//
//  Created by Amanda Christy on 4/4/17.
//  Copyright © 2017 Amanda Christy. All rights reserved.
//

import Foundation
extension String {
    
    func urlencode() -> String {
        let stringToEncode = self.replacingOccurrences(of: " ", with: "+")
        return stringToEncode.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!
    }
    
    func hmacsha1(key: String) -> Data {
        
        let dataToDigest = self.data(using: String.Encoding.utf8)
        let keyData = key.data(using: String.Encoding.utf8)
        
        let digestLength = Int(CC_SHA1_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<Any>.allocate(capacity: digestLength)
        
        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA1), (keyData! as NSData).bytes, keyData!.count, (dataToDigest! as NSData).bytes, dataToDigest!.count, result)
        
        return Data(bytes: UnsafePointer(result), count: digestLength)
        
    }
    
}
