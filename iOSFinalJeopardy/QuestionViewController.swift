//
//  QuestionViewController.swift
//  iOSFinalJeopardy
//
//  Created by Abigail Atchison on 5/12/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController{
    
    var Game : JeopardyGame?
    var CategoryNum : Int?
    var ValueNum : Int?
    var second = 30
    var timerExpired = false
    
    @IBOutlet var QuestionLabel: UILabel!
    @IBOutlet var ValueNumber: UILabel!
    @IBOutlet var TimerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "update", userInfo: nil, repeats: true)
        ValueNumber.text = ((ValueNum! * 200)+200 as NSNumber).stringValue
        
        
        
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
            QuestionLabel.text = "Question not found"
            
        }
        
        
        
        
    }
    
    func update()
    {
        second--;
        if(second == 0)
        {
            timerExpired = true
            AnswerClicked(TimerLabel)
        }
        else
        {
            if(second < 10)
            {
                TimerLabel.text = "00:0\(second)"
            }
            else
            {
                TimerLabel.text = "00:\(second)"
            }
            
        }
        
    }
    
    func addAnswer(Cat : Int, _ index : Int)
    {
        if(Cat == 1)
        {
            QuestionLabel.text = Game?.Cat1Q?[index]
        }
        else if(Cat == 2)
        {
            QuestionLabel.text = Game?.Cat2Q?[index]
        }
        else if(Cat == 3)
        {
            QuestionLabel.text = Game?.Cat3Q?[index]
        }
        else if(Cat == 4)
        {
            QuestionLabel.text = Game?.Cat4Q?[index]
        }
        else if(Cat == 5)
        {
            QuestionLabel.text = Game?.Cat5Q?[index]
        }
        else
        {
            QuestionLabel.text = "Answer Not Found"
        }
    }

    
    @IBAction func AnswerClicked(sender: AnyObject) {
        let navVC = storyboard!.instantiateViewControllerWithIdentifier("answer_viewNC") as! UINavigationController
        
        let AVC = navVC.viewControllers[0] as! AnswerViewController
        AVC.CategoryNum = CategoryNum
        AVC.Game = Game
        AVC.ValueNum = ValueNum
        AVC.timerExpired = timerExpired
        
        
        self.presentViewController(navVC, animated: true, completion: nil)
        
    }
    
    //TODO Timer Expired
    
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
