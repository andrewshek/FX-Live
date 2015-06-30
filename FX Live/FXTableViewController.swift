//
//  FXTableViewController.swift
//  FX Live
//
//  Created by Andrew Shek on 11/06/2015.
//  Copyright (c) 2015 Andrew Shek. All rights reserved.
//

import Foundation
import UIKit

// Action picker
// UI picker views

class FXTableViewController: UITableViewController {

let currency = ["USD", "EUR", "JPY", "HKD", "GBP"]
let fxRate = [1.223, 0.34, 0.78, 0.56, 0.34]
//let tempfxRate = ["1.223", "0.34", "0.78", "0.56", "0.34"]
var fxRates: fxRateAPI!
//var rates : [Dictionary<String, Double>]
//var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var testCurrency: Dictionary<String, Double>?
    
    override func viewDidLoad() {
        
        fxRates = fxRateAPI(currencies: currency, baseCurrency:"AUD")
        fxRates.getFXRates()
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currency.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        testCurrency = ["HKD": 5.951326, "USD": 0.7677, "GBP": 0.488276, "EUR": 0.687423, "JPY": 93.725433]

        var dictionaryTest = testCurrency
        
//        testCurrencyTwo = 
        
        var cell = tableView.dequeueReusableCellWithIdentifier("FXCell") as! FXTableViewCell
        
        cell.currencyName.text = currency[indexPath.row]

        
        var imageName = UIImage(named: currency[indexPath.row])
        cell.currencyImage.image = imageName
        
        //loop through dictionary
        
        
        cell.fxRate.text = "\(fxRate[indexPath.row])"
 
        
     
        
        return cell
    }
    
    @IBAction func unwindToFXTableViewControler(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let kittensFilterViewController = segue.sourceViewController as? SelectCurrencyViewController{
            
            
        }
    }
    
}

    
    




