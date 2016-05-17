//
//  ValueViewController.swift
//  iOSFinalJeopardy
//
//  Created by Abigail Atchison on 5/11/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class ValueViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var Game : JeopardyGame?
    var CategoryNum : Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        valueTableView.tableFooterView = UIView()
        self.valueTableView.dataSource = self
        self.valueTableView.delegate = self
        self.valueTableView.backgroundColor = UIColor.clearColor()
        
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onBackPressed(sender: AnyObject) {
        let navVC = storyboard!.instantiateViewControllerWithIdentifier("category_viewNC") as! UINavigationController
        
        let NVC = navVC.viewControllers[0] as! CategoryViewController
        NVC.Game = Game
            
        self.presentViewController(navVC, animated: true, completion: nil)

    }
    
    @IBOutlet var valueTableView: UITableView!
    
    //
    //    @IBAction func SettingsClicked(sender: AnyObject) {
    //        let tutorialVC = self.storyboard!.instantiateViewControllerWithIdentifier("email_view")
    //        self.presentViewController(tutorialVC, animated: true, completion: nil)
    //    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let value = (indexPath.row * 200) + 200
        cell.textLabel!.text = (value as NSNumber).stringValue
        
        if(isUsed(CategoryNum!,num: indexPath.row))
        {
            cell.userInteractionEnabled = false
            cell.textLabel?.textColor = UIColor .lightGrayColor()
        }
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let navVC = storyboard!.instantiateViewControllerWithIdentifier("question_viewNC") as! UINavigationController
        
        let QVC = navVC.viewControllers[0] as! QuestionViewController
        QVC.CategoryNum = CategoryNum
        QVC.Game = Game
        QVC.ValueNum = indexPath.row
        
        setUsed(CategoryNum!, num: indexPath.row)
        
        
        self.presentViewController(navVC, animated: true, completion: nil)
    }
    
    func isUsed(cat : Int, num : Int) -> Bool
    {
        if(cat == 0)
        {
            if(Game!.Cat1![num])
            {
                return true
            }
            else
            {
                return false
            }
        }
        else if(cat == 1)
        {
            if(Game!.Cat2![num])
            {
                return true
            }
            else
            {
                return false
            }
        }
        else if(cat == 2)
        {
            if(Game!.Cat3![num])
            {
                return true
            }
            else
            {
                return false
            }
        }
        else if(cat == 3)
        {
            if(Game!.Cat4![num])
            {
                return true
            }
            else
            {
                return false
            }
        }
        else if(cat == 4)
        {
            if(Game!.Cat5![num])
            {
                return true
            }
            else
            {
                return false
            }
        }
        else
        {
            return false
        }
    }
    
    func setUsed(cat : Int, num : Int)
    {
        if(cat == 0)
        {
            Game!.Cat1![num] = !Game!.Cat1![num]
        }
        else if(cat == 1)
        {
            Game!.Cat2![num] = !Game!.Cat2![num]
        }
        else if(cat == 2)
        {
            Game!.Cat3![num] = !Game!.Cat3![num]
        }
        else if(cat == 3)
        {
            Game!.Cat4![num] = !Game!.Cat4![num]
        }
        else if(cat == 4)
        {
            Game!.Cat5![num] = !Game!.Cat5![num]
        }
        
        Game!.numPushed += 1
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
