//
//  MasterViewController.swift
//  Weather
//
//  Created by Jayanth Devulapally on 12/15/15.
//  Copyright © 2015 varun. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var dict = NSMutableDictionary() //dictonary for data of the plist file
    var cities = [AnyObject]() //array for having all the city name (Keys)
    var plistPath = NSString()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action:"navigateToAddViewController:")
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    func navigateToAddViewController(sender: AnyObject){
        let svc = self.storyboard?.instantiateViewControllerWithIdentifier("add") as! AddCityViewController
        self.navigationController?.pushViewController(svc, animated:true)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
        
        // accessing the data from cities.plist file
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        plistPath = appDelegate.plistPathInDocument
        // Extract the content of the file as NSData
        let data:NSData =  NSFileManager.defaultManager().contentsAtPath(plistPath as String)!
        do{
            dict = try NSPropertyListSerialization.propertyListWithData(data, options: NSPropertyListMutabilityOptions.MutableContainersAndLeaves, format: nil) as! NSMutableDictionary
        }catch{
            print("Error occured while reading from the plist file")
        }
        cities = dict.allKeys
        self.tableView.reloadData();

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = dict.objectForKey(cities[indexPath.row]) as! String
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dict.allKeys.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = cities[indexPath.row] as! String
        cell.textLabel!.text = object
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    override func tableView(tableView: UITableView,
        commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath){
            // remove the row from the array
            dict.removeObjectForKey(cities[indexPath.row])
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            dict.writeToFile(plistPath as String, atomically: true)
    }


}

