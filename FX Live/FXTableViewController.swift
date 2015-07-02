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

var currency = ["USD", "EUR", "JPY", "HKD", "GBP"]
//var fxRate = [0.00, 0.00, 0.78, 0.56, 0.34]
    var fxRate = [0.00, 0.00, 0.00, 0.00, 0.00]
//let tempfxRate = ["1.223", "0.34", "0.78", "0.56", "0.34"]
var fxRates: fxRateAPI!
//var rates : [Dictionary<String, Double>]
//var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var testCurrency: Dictionary<String, Double>?
    
    override func viewDidLoad() {
        
        //fxRates = fxRateAPI(currencies: currency, baseCurrency:"AUD")
        //fxRates.getFXRates()
        DiggDataManager.sharedInstance.fetchAllWithNativeJSON { (result, error) -> Void in
        println(result)
            self.updateFXRate(result)
        }
        
    }
    
    func updateFXRate(Rates: Dictionary<String, Double>){
        
        fxRate = []
        
        for cur in currency {
            
            var individualRate: Double? = Rates[cur]
            fxRate.append(individualRate!)
            
        }
            
        
    tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currency.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        testCurrency = ["HKD": 5.951326, "USD": 0.7677, "GBP": 0.488276, "EUR": 0.687423, "JPY": 93.725433]

        
        var cell = tableView.dequeueReusableCellWithIdentifier("FXCell") as! FXTableViewCell
        
        cell.currencyName.text = currency[indexPath.row]

        
        var imageName = UIImage(named: currency[indexPath.row])
        cell.currencyImage.image = imageName
        
        //loop through dictionary
        
        
        cell.fxRate.text = "\(fxRate[indexPath.row])"
 
        
     
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let FXTableViewController = segue.destinationViewController as? SelectCurrencyViewController {
            FXTableViewController.currencySelected = currency
            
            
        }
    }
    
    @IBAction func unwindToFXTableViewControler(segue: UIStoryboardSegue, sender: AnyObject?) {
        
   
     
    }

    
}




