//
//  UrlViewController.swift
//  iOSFinalJeopardy
//
//  Created by Abigail Atchison on 5/16/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class UrlViewController: UIViewController {
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet var URLLink: UITextField!
    @IBOutlet var GameName: UITextField!
    
    @IBAction func InputClicked(sender: AnyObject) {
        if(URLLink.text?.isEmpty == false)
        {
            userDefaults.setValue(URLLink.text!, forKey: "FireBaseURL")
            userDefaults.setValue(true, forKey: "urlStored")
        }
    }

}
