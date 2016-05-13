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
        
        self.valueTableView.dataSource = self
        self.valueTableView.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let navVC = storyboard!.instantiateViewControllerWithIdentifier("question_viewNC") as! UINavigationController
        
        let QVC = navVC.viewControllers[0] as! QuestionViewController
        QVC.CategoryNum = CategoryNum
        QVC.Game = Game
        QVC.ValueNum = indexPath.row
        
        
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
