//
//  ViewController.swift
//  iOSFinalJeopardy
//
//  Created by Abigail Atchison on 5/10/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var testGame : JeopardyGame?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func StartClicked(sender: AnyObject) {
        
        test()
        let navVC = storyboard!.instantiateViewControllerWithIdentifier("category_viewNC") as! UINavigationController
        
        let catVC = navVC.viewControllers[0] as! CategoryViewController
        catVC.Game = testGame
        
        
        self.presentViewController(navVC, animated: true, completion: nil)
    }
    
    func test()
    {
        testGame = JeopardyGame(name: "test", twoPlayer: false)
        
        var testArray = ["cat1","cat2","cat3","cat4","cat5"]
        
        testGame!.Categories = testArray
        
        testArray = ["Q21","Q22","Q23","Q24","Q25"]
        testGame!.Q200 = testArray
        testArray = ["Q41","Q42","Q43","Q44","Q45"]
        testGame!.Q400 = testArray
        testArray = ["Q61","Q62","Q63","Q64","Q65"]
        testGame!.Q600 = testArray
        testArray = ["Q81","Q82","Q83","Q84","Q85"]
        testGame!.Q800 = testArray
        testArray = ["Q101","Q102","Q103","Q104","Q105"]
        testGame!.Q1000 = testArray
        testArray = ["A21","A22","A23","A24","A25"]
        testGame!.A200 = testArray
        testArray = ["A41","A42","A43","A44","A25"]
        testGame!.A400 = testArray
        testArray = ["A61","A62","A63","A64","A65"]
        testGame!.A600 = testArray
        testArray = ["A81","A82","A83","A84","A85"]
        testGame!.A800 = testArray
        testArray = ["A101","A102","A103","A104","A105"]
        testGame!.A1000 = testArray
        
    }

}

