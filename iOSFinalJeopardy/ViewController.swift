//
//  ViewController.swift
//  iOSFinalJeopardy
//
//  Created by Abigail Atchison on 5/10/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var testGame : JeopardyGame?
    let userDefaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let urlName = try? userDefaults.stringForKey("GameName")
//        if(urlName! != nil)
//        {
//            testGame = JeopardyGame(name: urlName!!, twoPlayer: false)
//        }
//        else
//        {
            testGame = JeopardyGame(name: "test name", twoPlayer: false)
//        }
        
        load()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func OnePlayerClicked(sender: AnyObject) {
        
        let navVC = storyboard!.instantiateViewControllerWithIdentifier("category_viewNC") as! UINavigationController
        
        let catVC = navVC.viewControllers[0] as! CategoryViewController
        catVC.Game = testGame
        
        
        self.presentViewController(navVC, animated: true, completion: nil)
    }
    @IBAction func SettingsClicked(sender: AnyObject) {
        let tutorialVC = self.storyboard!.instantiateViewControllerWithIdentifier("url_view")
            self.presentViewController(tutorialVC, animated: true, completion: nil)
    }
    
    @IBAction func TwoPlayerClicked(sender: AnyObject) {
        testGame?.TwoPlayer = true
        OnePlayerClicked(sender)
    }
    
    func load()
    {
        var url : String
        if(userDefaults.boolForKey("urlStored"))
        {
            url = userDefaults.stringForKey("FireBaseURL")!
        }
        else
        {
            url = "https://iosfinaljeopardy.firebaseio.com/"
        }
        
        let ref = Firebase(url:url)
        
        var index = 0
        ref.queryOrderedByChild("Number").observeEventType(.ChildAdded, withBlock: { snapshot in
            if let cat = snapshot.value["Name"] as? String {
                self.testGame!.Categories![index] = cat
                index++
            }
        })
        
        
        loadInfo(0)
        loadInfo(1)
        loadInfo(2)
        loadInfo(3)
        loadInfo(4)
    }
    func loadInfo(CategoryNum : Int)
    {
        var url : String
        if(userDefaults.boolForKey("urlStored"))
        {
            url = userDefaults.stringForKey("FireBaseURL")!
        }
        else
        {
            url = "https://iosfinaljeopardy.firebaseio.com/"
        }
        
        
        
        if(CategoryNum == 0)
        {
            url += "Category1"
            
        }
        else if(CategoryNum == 1)
        {
            url += "Category2"
            
        }
        else if(CategoryNum == 2)
        {
            url += "Category3"
        }
        else if(CategoryNum == 3)
        {
            url += "Category4"
        }
        else if(CategoryNum == 4)
        {
            url += "Category5"
        }
        else
        {
            //Incorrect input
        }
        
        Answers((url + "/Answers"), num: CategoryNum)
        Questions((url + "/Questions"), num: CategoryNum)
    }
    
    func Answers(url : String, num : Int)
    {
        
        let myRootRef = Firebase(url:url)
        
        var index = 0
        
        myRootRef.queryOrderedByChild("Answers/").observeEventType(.ChildAdded, withBlock: { snapshot in
            if let answer = snapshot.value as? String {
                if(num == 0)
                {
                    self.testGame!.Cat1A![index] = answer
                }
                else if(num == 1)
                {
                    self.testGame!.Cat2A![index] = answer
                }
                else if(num == 2)
                {
                    self.testGame!.Cat3A![index] = answer
                }
                else if(num == 3)
                {
                    self.testGame!.Cat4A![index] = answer
                }
                else if(num == 4)
                {
                    self.testGame!.Cat5A![index] = answer
                }
                
                index++
            }
            else
            {
                print("no answer")
            }
        })
        

    }
    
    func Questions(url : String, num : Int)
    {
        let myRootRef = Firebase(url:url)
        
        var index = 0
        
        myRootRef.queryOrderedByChild("Questions/").observeEventType(.ChildAdded, withBlock: { snapshot in
            if let question = snapshot.value as? String {
                if(num == 0)
                {
                    self.testGame!.Cat1Q![index] = question
                }
                else if(num == 1)
                {
                    self.testGame!.Cat2Q![index] = question
                }
                else if(num == 2)
                {
                    self.testGame!.Cat3Q![index] = question
                }
                else if(num == 3)
                {
                    self.testGame!.Cat4Q![index] = question
                }
                else if(num == 4)
                {
                    self.testGame!.Cat5Q![index] = question
                }

                index++
            }
            else
            {
                print("no question")
            }
        })

    }

}

