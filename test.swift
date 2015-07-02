//
//  test.swift
//  FX Live
//
//  Created by Andrew Shek on 1/07/2015.
//  Copyright (c) 2015 Andrew Shek. All rights reserved.
//

import Foundation
import Alamofire

class DiggData4Manager {
    private let url = "https://ajax.googleapis.com/ajax/services/feed/load"
    private let resultsLimit = 100
   // private var articles:[Article] = []
    
    static let sharedInstance:DiggDataManager = DiggDataManager()
    
    // This function uses Alamofire's .responseJSON method to take care of taking the NSData returned
   /* func fetchAllWithNativeJSON(completion:(result:[], error:NSError?) -> Void) {
        Alamofire.request(.GET, url, parameters: ["v": "1.0", "q": "http://www.digg.com/rss/index.xml", "num": resultsLimit])
            
            // We use responseJSON so Alamofire will automatically take the NSData returned and parse the JSON, returning an AnyObject
            .responseJSON {(request, response, JSON, error) in
                
                // The below is called a "guard" and Swift 2.0 has built-in syntax for it.
                // A guard is a way to handle an error case and return early. Like a circuit-breaker.
                // If we've experienced an error, or no JSON was returned, then we know we won't have any articles so set it to empty and call
                // the completion handler with the NSError
                if error != nil || JSON == nil {
                   // self.articles = []
                    completion(result: self.articles, error: error)
                    return
                }
                
                // If we get here, it means we've got JSON to parse...
                // But the error handling doesn't stop there.
                
                // Step 1. Getting to our entries (article) with no built-in libraries
                // We're not interested in any of the response metadata, only the entries array.
                // However, using Swift's built-in API's, we can't just jump straight to entries, we
                // have to go key-by-key for safety.
                
                // 1. Parsing the JSON response manually
                if let JSONData = JSON as? [String:AnyObject],
                    let responseData = JSONData["responseData"] as? [String:AnyObject],
                    let feed = responseData["feed"] as? [String:AnyObject],
                    let entries = feed["entries"] as? [AnyObject] {
                        println(entries)
                }
                
                // That code is pretty yuck. SwiftyJSON makes things easier
        }
    }*/
}