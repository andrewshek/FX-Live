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
        
    }
    
        
    func getFXRates () -> Dictionary<String, Double> {
    
            
//        var quotes:Dictionary<String, Double>

        Alamofire.request(.GET, fullURI!)
            .responseJSON{ (_, _, JSON, _) in
                let data = JSON as! [String:AnyObject]
                var quotes = Dictionary<String, Double>()
                
                if let quotesData:[String:AnyObject] = data["quotes"] as? [String:AnyObject] {
                    
                  
                    for (key, val) in quotesData {
                        let quoteValue = val as! Double
                        let currencyKeyIndex = advance(3, 3)
                        //println(key[currencyKeyIndex])
//                        quotes[currency] = quoteValue
                    }
                }
                println(quotes)
        
        }
        
        return Dictionary<String, Double>()
    
//        return quotes
        
              /*if let quouteToReturn = quotes {
                    return quoteToReturn
                } else {
                
                quotes = [["AUDHKD": 5.951326], ["AUDUSD": 0.7677], ["AUDGBP": 0.488276], ["AUDEUR": 0.687423], ["AUDJPY": 93.725433]]
                
                return quotes
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






