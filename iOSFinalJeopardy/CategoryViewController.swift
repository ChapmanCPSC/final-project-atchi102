//
//  CategoryViewController.swift
//  iOSFinalJeopardy
//
//  Created by Abigail Atchison on 5/11/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var Game : JeopardyGame?
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet var categoryTableView: UITableView!
    @IBOutlet var Player1Score: UILabel!
    @IBOutlet var Player2Score: UILabel!

    
    @IBOutlet var GameOverLabel: UILabel!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        categoryTableView.tableFooterView = UIView()
        if(Game!.numPushed == 25)
        {
            if(Game?.TwoPlayer == true)
            {
                if(Game?.Player1Score>Game?.Player2Score)
                {
                    GameOverLabel.text = "Game Over! Player 1 Wins"
                }
                else if(Game?.Player1Score<Game?.Player2Score)
                {
                    GameOverLabel.text = "Game Over! Player 2 Wins"
                }
                else
                {
                    GameOverLabel.text = "Game Over! You tied!"
                }
            }
            else
            {
                GameOverLabel.text = "Game Over!"
            }
            
        }
        else
        {
            GameOverLabel.text = ""
        }
        self.categoryTableView.dataSource = self
        self.categoryTableView.delegate = self
        self.categoryTableView.backgroundColor = UIColor.clearColor()
        
        if(Game?.TwoPlayer == false)
        {
            Player2Score.hidden = true
            Player1Score.text = "Score: " + ((Game?.Player1Score)! as NSNumber).stringValue
        }
        else
        {
            Player1Score.text = "Score: " + ((Game?.Player1Score)! as NSNumber).stringValue
            Player2Score.text = "Score: " + ((Game?.Player2Score)! as NSNumber).stringValue
            userDefaults.setBool(!(userDefaults.boolForKey("PlayerTurn")), forKey: "PlayerTurn")
        }
        
        
        
    }
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
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

    @IBAction func onBackPressed(sender: AnyObject) {
        
        let navVC = storyboard!.instantiateViewControllerWithIdentifier("main_view") as! UINavigationController
        
        self.presentViewController(navVC, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.Game?.Categories?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel!.text = self.Game?.Categories?[indexPath.row]
        
        if(Game!.numPushed == 25)
        {
            cell.userInteractionEnabled = false
            cell.textLabel?.textColor = UIColor .grayColor()
        }

        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let navVC = storyboard!.instantiateViewControllerWithIdentifier("value_viewNC") as! UINavigationController
        
        let valueVC = navVC.viewControllers[0] as! ValueViewController
        valueVC.CategoryNum = indexPath.row
        valueVC.Game = Game
        
        
        self.presentViewController(navVC, animated: true, completion: nil)
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
