//
//  CardSmithApi.swift
//  s
//
//  Created by Sabin Kim  on 09/05/2017.
//  Copyright © 2017 Amanda Christy. All rights reserved.
//

 

import Foundation
import Alamofire

/*
 
 An object to handle requests to the CardSmith API
 
 */
class CardSmithApi : NSObject {
    
    var apiUrl: String
    var apiVersion: String
    var applicationId: String
    var seed: String
    
    /* Create the object from the credentials property list */
    init(_ dict: Dictionary<String, String>) {
        self.apiUrl = dict["apiUrl"]!
        self.apiVersion = dict["apiVersion"]!
        self.applicationId = dict["applicationId"]!
        self.seed = dict["seed"]!
    }
    
    /* Authenticate a username/password pair and return the matching User object, or nil if no user matches */
    func loginAuthenticate(username: String, password: String, completion: @escaping (_: [String: Any]) -> Void) {
        let timestamp = Int(NSDate().timeIntervalSince1970 * 1000)
        
        let params: [String: Any] = [
            "apiVersion": self.apiVersion,
            "applicationId": self.applicationId,
            "username": username,
            "password": password,
            "hash": "\(self.seed)\(self.apiVersion)\(self.applicationId)\(timestamp)".sha1(),
            "timestamp": timestamp
        ]
        
        Alamofire.request(self.apiUrl + "globalLoginValidate", method: .post, parameters: params).responseJSON { response in
            guard let json = response.result.value as? [String: Any] else {
                print("Did not receive a JSON response")
                print("Error: \(response.result.error!)")
                return
            }
            completion(json)
        }
}

}
