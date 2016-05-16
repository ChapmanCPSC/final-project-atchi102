//
//  AnswerViewController.swift
//  iOSFinalJeopardy
//
//  Created by Abigail Atchison on 5/12/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var Game : JeopardyGame?
    var CategoryNum : Int?
    var ValueNum : Int?
    var timerExpired : Bool?
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet var AnswerLabel: UILabel!
    @IBOutlet var ValueLabel: UILabel!
    @IBOutlet var IncorrectButton: UIButton!
    @IBOutlet var CorrectButton: UIButton!
    
    
    @IBAction func CorrectClicked(sender: AnyObject) {
        if(Game?.TwoPlayer == true)
        {
            if(userDefaults.boolForKey("PlayerTurn"))
            {
                Game?.Player1Score += (ValueNum! * 200)+200
            }
            else
            {
                Game?.Player2Score += (ValueNum! * 200)+200
            }
        }
        else
        {
            Game?.Player1Score += (ValueNum! * 200)+200
        }
        NavigatetoCategories()
    }
    
    @IBAction func IncorrectClicked(sender: AnyObject) {
        if(Game?.TwoPlayer == true)
        {
            if(userDefaults.boolForKey("PlayerTurn"))
            {
                Game?.Player1Score -= (ValueNum! * 200)+200
            }
            else
            {
                Game?.Player2Score -= (ValueNum! * 200)+200
            }
        }
        else
        {
            Game?.Player1Score -= (ValueNum! * 200)+200
        }
        NavigatetoCategories()
    }
    
    func NavigatetoCategories()
    {
        let navVC = storyboard!.instantiateViewControllerWithIdentifier("category_viewNC") as! UINavigationController
        
        let CatVC = navVC.viewControllers[0] as! CategoryViewController
        CatVC.Game = Game
        
        
        self.presentViewController(navVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ValueLabel.text = ((ValueNum! * 200)+200 as NSNumber).stringValue
        
        switch ((ValueNum! * 200)+200){
        case 200:
            addAnswer(CategoryNum! + 1, 1)
        case 400:
            addAnswer(CategoryNum! + 1, 2)
        case 600:
            addAnswer(CategoryNum! + 1, 3)
        case 800:
            addAnswer(CategoryNum! + 1, 4)
        case 1000:
            addAnswer(CategoryNum! + 1, 0)
        default:
            AnswerLabel.text = "Question not found"
            
        }
        
        
        
        
    }
    
    func addAnswer(Cat : Int, _ index : Int)
    {
        if(Cat == 1)
        {
            AnswerLabel.text = Game?.Cat1A?[index]
        }
        else if(Cat == 2)
        {
            AnswerLabel.text = Game?.Cat2A?[index]
        }
        else if(Cat == 3)
        {
            AnswerLabel.text = Game?.Cat3A?[index]
        }
        else if(Cat == 4)
        {
            AnswerLabel.text = Game?.Cat4A?[index]
        }
        else if(Cat == 5)
        {
            AnswerLabel.text = Game?.Cat5A?[index]
        }
        else
        {
            AnswerLabel.text = "Answer Not Found"
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    //    @IBAction func SettingsClicked(sender: AnyObject) {
    //        let tutorialVC = self.storyboard!.instantiateViewControllerWithIdentifier("email_view")
    //        self.presentViewController(tutorialVC, animated: true, completion: nil)
    //    }
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    


}
