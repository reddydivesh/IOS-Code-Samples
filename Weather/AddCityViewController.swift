//
//  AddCityViewController.swift
//  Weather
//
//  Created by Jayanth Devulapally on 12/15/15.
//  Copyright © 2015 varun. All rights reserved.
//

import Foundation
import UIKit


class AddCityViewController: UIViewController {
    
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var stateText: UITextField!
    override func viewDidLoad() {
        
    }
    
    @IBAction func addCityAction(sender: AnyObject) {
        
        //conf json data url
        let urlString = NSString (format: "https://query.yahooapis.com/v1/public/yql?q=select%%20*%%20from%%20weather.forecast%%20where%%20woeid%%20in%%20(select%%20woeid%%20from%%20geo.places(1)%%20where%%20text%%3D%%22%@%%2C%%20%@%%22)&format=json&env=store%%3A%%2F%%2Fdatatables.org%%2Falltableswithkeys", cityText.text!, stateText.text!) as String
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let pathForThePlistFile = appDelegate.plistPathInDocument
        
        // Extract the content of the file as NSData
        let data:NSData =  NSFileManager.defaultManager().contentsAtPath(pathForThePlistFile)!
        // Convert the NSData to mutable array
        do{
            let cityDict = try NSPropertyListSerialization.propertyListWithData(data, options: NSPropertyListMutabilityOptions.MutableContainersAndLeaves, format: nil) as! NSMutableDictionary
            cityDict.setObject(urlString, forKey:cityText.text!)
            // Save to plist
            cityDict.writeToFile(pathForThePlistFile, atomically: true)
        }catch{
            print("An error occurred while writing to plist")
        }
        // Dismiss the modal controller
        self.navigationController?.popViewControllerAnimated(true);
    }
        
}
