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
    var currencySelected = [String] ()
    let fxRate = [1.223, 0.34, 0.78, 0.56, 0.34, 0.89]
    
    override func viewDidLoad() {
        
        
    }
    
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
                currencySelected.append("CHF")
                println(currencySelected)
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
    
    
    /*override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        // Toggle between checked/unchecked state
        // TODO If checked, record favourited colour
        switch (cell!.accessoryType) {
        case .Checkmark:
            cell?.accessoryType = UITableViewCellAccessoryType.None
            // Add colour
        default:
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            // Remove colour
            
        }
        
    }*/
 
    @IBAction func Add(segue: UIStoryboardSegue) {
        
        if let FXTableViewController = segue.destinationViewController as? FXTableViewController {
            FXTableViewController.fxRate = []
            FXTableViewController.currency = []
            
            FXTableViewController.fxRate = fxRate
            FXTableViewController.currency = currencySelected
        }
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let FXTableViewController = segue.destinationViewController as? FXTableViewController {
          /*  FXTableViewController.fxRate = []
            FXTableViewController.currency = []
            
            FXTableViewController.fxRate = fxRate
            FXTableViewController.currency = currencySelected*/
        }
    }
    
}
