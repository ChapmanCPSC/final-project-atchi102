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
    
    @IBOutlet var QuestionLabel: UILabel!
    @IBOutlet var ValueNumber: UILabel!
    @IBOutlet var TimerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ValueNumber.text = ((ValueNum! * 200)+200 as NSNumber).stringValue
        
        
        switch ((ValueNum! * 200)+200){
        case 200:
            QuestionLabel.text = Game?.Q200?[(CategoryNum)!]
        case 400:
            QuestionLabel.text = Game?.Q400?[(CategoryNum)!]
        case 600:
            QuestionLabel.text = Game?.Q600?[(CategoryNum)!]
        case 800:
            QuestionLabel.text = Game?.Q800?[(CategoryNum)!]
        case 1000:
            QuestionLabel.text = Game?.Q1000?[(CategoryNum)!]
        default:
            QuestionLabel.text = "Question not found"
            
        }
        
    }
    
    @IBAction func AnswerClicked(sender: AnyObject) {
        let navVC = storyboard!.instantiateViewControllerWithIdentifier("answer_viewNC") as! UINavigationController
        
        let AVC = navVC.viewControllers[0] as! QuestionViewController
        AVC.CategoryNum = CategoryNum
        AVC.Game = Game
        AVC.ValueNum = ValueNum
        
        
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
