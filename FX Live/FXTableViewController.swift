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
    
    override func viewDidLoad() {
        fxRates = fxRateAPI(currencies: currency, baseCurrency:"AUD")
        fxRates.getFXRates()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currency.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("FXCell") as! FXTableViewCell
        
        cell.currencyName.text = currency[indexPath.row]
        
        var imageName = UIImage(named: currency[indexPath.row])
        cell.currencyImage.image = imageName
        
        //cell.fxRate.text = tempfxRate[indexPath.row]
        cell.fxRate.text = "\(fxRate[indexPath.row])"
        
        return cell
    }
    
    @IBAction func unwindToFXTableViewControler(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let kittensFilterViewController = segue.sourceViewController as? SelectCurrencyViewController{
            
            
        }
    }
    
}

    
    




