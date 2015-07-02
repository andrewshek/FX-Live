import Foundation
import Alamofire

class DiggDataManager {
    private let url = "https://www.apilayer.net/api/live?access_key=c0cbd57fa6b92df4a3ce946db2977a8c&currencies=USD,EUR,JPY,HKD,GBP&source=AUD&format=1"
    //private var quotes:Dictionary[String, Double] = []
    var quotes = Dictionary<String, Double>()
    
    static let sharedInstance:DiggDataManager = DiggDataManager()
    
    // This function uses Alamofire's .responseJSON method to take care of taking the NSData returned
    func fetchAllWithNativeJSON(completion:(result:Dictionary<String, Double>, error:NSError?) -> Void) {
        Alamofire.request(.GET, url)
            
            // We use responseJSON so Alamofire will automatically take the NSData returned and parse the JSON, returning an AnyObject
            .responseJSON {(request, response, JSON, error) in
                self.quotes = Dictionary<String, Double>()
                
                // The below is called a "guard" and Swift 2.0 has built-in syntax for it.
                // A guard is a way to handle an error case and return early. Like a circuit-breaker.
                // If we've experienced an error, or no JSON was returned, then we know we won't have any articles so set it to empty and call
                // the completion handler with the NSError
                if error != nil || JSON == nil {
                    
                    completion(result: self.quotes, error: error)
                    return
                }
                
                // If we get here, it means we've got JSON to parse...
                // But the error handling doesn't stop there.
                
                // Step 1. Getting to our entries (article) with no built-in libraries
                // We're not interested in any of the response metadata, only the entries array.
                // However, using Swift's built-in API's, we can't just jump straight to entries, we
                // have to go key-by-key for safety.
                
                // 1. Parsing the JSON response manually
                let data = JSON as! [String:AnyObject]
                //var quotes = Dictionary<String, Double>()
                
                if let quotesData:[String:AnyObject] = data["quotes"] as? [String:AnyObject] {
                    
                    for (key, val) in quotesData {
                        let quoteValue = val as! Double
                        let fullCurrencyKeyIndex = key as NSString
                        let currencyKeyIndex = fullCurrencyKeyIndex.substringWithRange(NSRange(location:3, length:3))
                        //println(key[currencyKeyIndex])
                        self.quotes[currencyKeyIndex] = quoteValue
                    }
                }
                
                completion(result: self.quotes, error: error)
        }
    }
}