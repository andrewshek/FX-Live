//
//  SelectCurrencyViewController.swift
//  FX Live
//
//  Created by Andrew Shek on 23/06/2015.
//  Copyright (c) 2015 Andrew Shek. All rights reserved.
//

import Foundation
import UIKit

class SelectCurrencyViewController: UITableViewController {
    
    let currency = ["USD", "EUR", "JPY", "HKD", "GBP", "CHF"]

    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currency.count
    }
    
    // Select currency cells
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let tableViewCell = tableView.cellForRowAtIndexPath(indexPath) {
            
            if(tableViewCell.accessoryType == UITableViewCellAccessoryType.Checkmark)
            {
                tableViewCell.accessoryType = UITableViewCellAccessoryType.None
            }
            else
            {
                tableViewCell.accessoryType = UITableViewCellAccessoryType.Checkmark
            }
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var tableViewCell = tableView.dequeueReusableCellWithIdentifier("FXCell") as! SelectCurrencyCell
        
        tableViewCell.currencyName.text = currency[indexPath.row]
        
        var imageName = UIImage(named: currency[indexPath.row])
        tableViewCell.currencyImage.image = imageName
        
        
        return tableViewCell
    }
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let FXTableViewController = segue.destinationViewController as? FXTableViewController {
            
        }
    }*/
    
}
