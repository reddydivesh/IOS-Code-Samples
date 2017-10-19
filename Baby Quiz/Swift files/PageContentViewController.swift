//
//  PageContentViewController.swift
//  Baby Quiz
//
//  Created by Jayanth Devulapally on 5/7/16.
//  Copyright © 2016 jkdevapps. All rights reserved.
//

import UIKit

protocol NextQuestionDelegate: class {
    func nextQuestion(index:Int)
}

class PageContentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionTable: UITableView!
    weak var delegate:NextQuestionDelegate?
    
    var pageIndex : Int?
    var imageName = ""
    var question = ""
    var answer = ""
    var options = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionTable.delegate = self
        optionTable.dataSource = self
        questionLabel.text = question
        answer = options[3]
        questionImage.image = UIImage(named: "\(answer).png")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count - 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = options[indexPath.row]
        cell.contentView.layer.cornerRadius = 25.0
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if answer == tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text{
            delegate?.nextQuestion(pageIndex!)
            if pageIndex == 2 {
                let endViewController = storyboard?.instantiateViewControllerWithIdentifier("congratulation")
                navigationController?.pushViewController(endViewController!, animated: true)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
