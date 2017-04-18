//
//  User.swift
//  Lion Card App (3)
//
//  Created by Amanda Christy on 4/4/17.
//  Copyright © 2017 Amanda Christy. All rights reserved.
//

import Foundation
enum ResponseField: String {
    case TITLE = "ut",
    URL = "uu",
    MOZ_RANK = "umrp",
    MOZ_TRUST = "utrp",
    SPAM_SCORE = "fspsc",
    PAGE_AUTHORITY = "upa",
    DOMAIN_AUTHORITY = "pda",
    EXT_EQUITY_LINKS = "ueid",
    TIME_LAST_CRAWLED = "ulc"
    
    static let valuesToPull = [TITLE, URL, MOZ_RANK, PAGE_AUTHORITY, DOMAIN_AUTHORITY, EXT_EQUITY_LINKS, TIME_LAST_CRAWLED]
}

class User {
    static let responseFields: [ResponseField:[AnyObject]] = [
        ResponseField.TITLE:["Page Title" as AnyObject, 1 as AnyObject],
        ResponseField.URL:["Canonical URL" as AnyObject, 4 as AnyObject],
        ResponseField.EXT_EQUITY_LINKS:["External Equity Links" as AnyObject, 32 as AnyObject],
        ResponseField.MOZ_RANK:["MozRank: URL"as AnyObject, 16384 as AnyObject],
        ResponseField.MOZ_TRUST:["MozTrust"as AnyObject, 131072 as AnyObject],
        ResponseField.SPAM_SCORE:["Subdomain Spam Score"as AnyObject, 67108864 as AnyObject],
        ResponseField.PAGE_AUTHORITY:["Page Authority"as AnyObject, 34359738368 as AnyObject],
        ResponseField.DOMAIN_AUTHORITY:["Domain Authority"as AnyObject, 68719476736 as AnyObject],
        ResponseField.TIME_LAST_CRAWLED:["Time Last Crawled"as AnyObject, 144115188075855872 as AnyObject]
    ]
}
