//
//  CategoryViewController.swift
//  Baby Quiz
//
//  Created by Jayanth Devulapally on 5/8/16.
//  Copyright © 2016 jkdevapps. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    //Animal Category Q&A
    let animalsQuestions = ["1.What is this ?": ["Tiger","Dog","Cat","Tiger"],
                            "2.What is this ?": ["Dog","Tiger","Cat","Cat"],
                            "3.What is this ?": ["Cat","Dog","Tiger","Dog"]]
    
    var animalAnswers = ["Tiger","Cat","Dog"]
    
    //Maths Category Q&A
    let mathsQuestion = ["What is 2 + 2?": ["3","4","0","4"],
                        "What is 2 - 1?": ["1","3","4","1"],
                        "What is 2 + 3?": ["3","2","5","5"]]
    
    let mathsAnswers = ["4","1","5"]
    
    

    @IBAction func animalCategory(sender: AnyObject) {
    }
    
    @IBAction func mathsCategory(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let quizViewController = segue.destinationViewController as! QuizViewController
        if segue.identifier == "animalSegue" {
            quizViewController.categoryQuestions = animalsQuestions
            quizViewController.categoryAnswers = animalAnswers
        } else if segue.identifier == "mathsSegue"{
            quizViewController.categoryQuestions = mathsQuestion
            quizViewController.categoryAnswers = mathsAnswers
        }
    }

}
