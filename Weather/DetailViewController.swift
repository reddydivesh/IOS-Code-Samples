//
//  DetailViewController.swift
//  Weather
//
//  Created by Jayanth Devulapally on 12/15/15.
//  Copyright © 2015 varun. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temparatureLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var sunRaiseLabel: UILabel!
    @IBOutlet weak var sunSetLabel: UILabel!
    
    var jsonObject = NSDictionary()

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            getJSON((detail.description))
        }
    }
    
    func getJSON(urlToRequest: String){
        let jsonData = NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
        //var error: NSError?
        do{
        jsonObject = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
        }catch{
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        //City Label update
        let cityName = jsonObject.valueForKey("query")?.valueForKey("results")?.valueForKey("channel")!.valueForKey("title")
        cityLabel.text = cityName as? String
        
        //temparature
        let temparature = jsonObject.valueForKey("query")?.valueForKey("results")?.valueForKey("channel")!.valueForKey("item")?.valueForKey("condition")?.valueForKey("temp")
        temparatureLabel.text = temparature as? String
        
        //condition
        let condition = jsonObject.valueForKey("query")?.valueForKey("results")?.valueForKey("channel")!.valueForKey("item")?.valueForKey("condition")?.valueForKey("text")
        conditionLabel.text = condition as? String
        
        //high
        let highTemp = jsonObject.valueForKey("query")?.valueForKey("results")?.valueForKey("channel")!.valueForKey("item")?.valueForKey("forecast")?.valueForKey("high")![0]
        highTempLabel.text = NSString(format:"Today's High: %@ F",highTemp as! String) as String
        
        //low
        let lowTemp = jsonObject.valueForKey("query")?.valueForKey("results")?.valueForKey("channel")!.valueForKey("item")?.valueForKey("forecast")?.valueForKey("low")![0]
        lowTempLabel.text = NSString(format:"Today's Low: %@ F",lowTemp as! String) as String
        
        //wind speed
        let windSpeed = jsonObject.valueForKey("query")?.valueForKey("results")?.valueForKey("channel")!.valueForKey("wind")?.valueForKey("speed")
        windSpeedLabel.text = NSString(format:"Wind: %@ mph",windSpeed as! String) as String
        
        //humidity
        let humidity = jsonObject.valueForKey("query")?.valueForKey("results")?.valueForKey("channel")!.valueForKey("atmosphere")?.valueForKey("humidity")
        humidityLabel.text = NSString(format:"Humidity: %@%%",humidity as! String) as String
        
        //pressure
        let pressure = jsonObject.valueForKey("query")?.valueForKey("results")?.valueForKey("channel")!.valueForKey("atmosphere")?.valueForKey("pressure")
        pressureLabel.text = NSString(format:"Pressure: %@ in",pressure as! String) as String
        
        //sunrise
        let sunrise = jsonObject.valueForKey("query")?.valueForKey("results")?.valueForKey("channel")!.valueForKey("astronomy")?.valueForKey("sunrise")
        sunRaiseLabel.text = NSString(format:"Sunrise: %@",sunrise as! String) as String
        
        //sunset
        let sunset = jsonObject.valueForKey("query")?.valueForKey("results")?.valueForKey("channel")!.valueForKey("astronomy")?.valueForKey("sunset")
        sunSetLabel.text = NSString(format:"Sunset: %@",sunset as! String) as String
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

