//
//  FX_API.swift
//  FX Live
//
//  Created by Andrew Shek on 16/06/2015.
//  Copyright (c) 2015 Andrew Shek. All rights reserved.
//


import Foundation
import Alamofire

class fxRateAPI {

    let URI = "https://www.apilayer.net/api/live?access_key="
    let accessKey = "c0cbd57fa6b92df4a3ce946db2977a8c"
    //let currencies = "&currencies=EUR,GBP,CAD,PLN&source=AUD&format=1"
    //https://apilayer.net/api/live?access_key=c0cbd57fa6b92df4a3ce946db2977a8c&currencies=EUR,GBP,CAD,PLN&source=USD&format=1
    
    var fullURI:String?
    var baseCurrency:String?
    
    init(currencies:[String], baseCurrency:String){
        
        var currencies = convertCurrenicesToString(currencies)
        
        if let tempCurrencies = currencies {
            
            fullURI = URI + accessKey + "&currencies=" + tempCurrencies + "&source=" + baseCurrency + "&format=1"
            
            }
        print(fullURI)
    }
        
    func getFXRates (){
            
            
        Alamofire.request(.GET, fullURI!)
            .responseJSON{ (_, _, JSON, _) in
                var quotes:[Dictionary<String, Double>] = []
                let data = JSON as! [String:AnyObject]
                
                if let quotesData:[String:AnyObject] = data["quotes"] as? [String:AnyObject] {
                    for (key, val) in quotesData {
                        let quoteValue = val as! Double
                        quotes.append([key:quoteValue])
                    }
                    
                    println(quotes)
                }
                
                print(data)
                            
            }
        /*var endPoint = NSURL(string: fullURI!)
        var data = NSData(contentsOfURL: endPoint!)
        println(data)
        if let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
            if let items = json["items"] as? NSArray {
                for item in items {
                    // construct your model objects
        
        }*/
        
    }
    
    // transform currencies in array to URI
    func convertCurrenicesToString(currencies:[String]) -> String? {
 
        
        var currencyString:String?
        
        for currency in currencies {
            
            if let tempCurrencyString = currencyString {
                currencyString = tempCurrencyString + "," + currency
            }
            else {
                currencyString = currency
            }
        }
        
        return currencyString
    }
    
    

        
    


}






