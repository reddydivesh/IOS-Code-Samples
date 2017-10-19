//
//  ViewController.swift
//  Baby Quiz
//
//  Created by Jayanth Devulapally on 5/7/16.
//  Copyright © 2016 jkdevapps. All rights reserved.
//

import UIKit

class QuizViewController: UIPageViewController,UIPageViewControllerDelegate, UIPageViewControllerDataSource, NextQuestionDelegate {
    
    var categoryQuestions = [String:[String]]()
    var categoryAnswers = [String]()
    
    var pageViewController : UIPageViewController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        delegate = self
        let pageContentViewContreoller = self.viewControllerAtIndex(0)
        setViewControllers([pageContentViewContreoller!], direction: UIPageViewControllerNavigationDirection.Forward , animated: true, completion: nil)
        view.addSubview((pageContentViewContreoller?.view)!)
    }
    
    override func viewDidAppear(animated: Bool) {
    }
    
    func viewControllerAtIndex(index : Int) -> UIViewController? {
        
        let pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as! PageContentViewController
        pageContentViewController.delegate = self
        pageContentViewController.pageIndex = index
        pageContentViewController.question = [String] (categoryQuestions.keys)[index]
        pageContentViewController.options = [[String]] (categoryQuestions.values)[index]
        pageContentViewController.view.layoutIfNeeded()
        return pageContentViewController
    }
    
    //pageview delegate methods
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! PageContentViewController).pageIndex!
        index += 1
        if index == categoryQuestions.count {
            return nil
        }
        return self.viewControllerAtIndex(index)
        
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! PageContentViewController).pageIndex!
        if index == 0 {
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index)
    }
    
//    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//        
//        return animalsQuestions.count
//    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        
        return 0
    }
    
    //pagecontentview delegatemethod
    func nextQuestion(index:Int) {
        if index == categoryQuestions.count-1 {
//        viewControllerAtIndex(index+1)
        } else{
            setViewControllers([viewControllerAtIndex(index+1)!], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

