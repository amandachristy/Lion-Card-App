//
//  User.swift
//  s
//
//  Created by Sabin Kim  on 09/05/2017.
//  Copyright © 2017 Amanda Christy. All rights reserved.
//

import Foundation

/*
 
 A CardSmith User object
 
 */
class User : NSObject {
    
    var firstName: String = ""
    var lastName: String = ""
    var cardholderId: String = ""
    var activeCardNumber: String = ""
    var issuerId: String = ""
    var mobileURL: URL?
    var accounts: [Account] = []
    
    /* Construct a CardSmith User from the JSON data in the API response */
    init?(data: [String: Any]) {
        super.init()
        
        for(key, value) in data {
            switch key {
            case "firstName":
                self.firstName = String(describing: value)
                break
            case "lastName":
                self.lastName = String(describing: value)
                break
            case "cardholderId":
                self.cardholderId = String(describing: value)
                break
            case "activeCardNumber":
                self.activeCardNumber = String(describing: value)
                break
            case "issuerId":
                self.issuerId = String(describing: value)
                break
            case "mobileURL":
                self.mobileURL = URL(string: value as! String)!
                break
            case "accounts":
                /* build Account objects out of the accounts JSON data */
                for account in value as! [[String: Any]] {
                    self.accounts.append(Account(data: account["account"] as! [String: Any]))
                }
                break
            case "success":
                if (value as! Bool != true) {
                    return nil
                }
                break
            default:
                print("Unknown User field `\(key)` = '\(value)'")
            }
        }
    }
    
    /* generate a convenient string describing the object when requested */
    override public var description: String {
        return "User: [\n\tfirstName: \(firstName)\n\tlastName: \(lastName)\n\tactiveCardNumber: \(activeCardNumber)\n\tactiveCardNumber: \(activeCardNumber)\n\tissuerId: \(issuerId)\n\tmobileURL: \(mobileURL!)\n\taccounts: \(accounts)\n]"
    }
}
