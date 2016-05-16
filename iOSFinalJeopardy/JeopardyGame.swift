//
//  JeopardyGame.swift
//  iOSFinalJeopardy
//
//  Created by Abigail Atchison on 5/11/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import Foundation

class JeopardyGame{
    
    var GameName: String
    var Categories: [String]?
    var Cat1Q: [String]?
    var Cat2Q: [String]?
    var Cat3Q: [String]?
    var Cat4Q: [String]?
    var Cat5Q: [String]?
    var Cat1A: [String]?
    var Cat2A: [String]?
    var Cat3A: [String]?
    var Cat4A: [String]?
    var Cat5A: [String]?
    var TwoPlayer : Bool
    var Player1Score : Int
    var Player2Score : Int
    
    init(name: String, twoPlayer : Bool)
    {
        GameName = name
        TwoPlayer = twoPlayer
        Player1Score = 0
        Player2Score = 0
        
        Categories = ["","","","",""]
        Cat1Q = ["","","","",""]
        Cat1A = ["","","","",""]
        Cat2Q = ["","","","",""]
        Cat2A = ["","","","",""]
        Cat3Q = ["","","","",""]
        Cat3A = ["","","","",""]
        Cat4Q = ["","","","",""]
        Cat4A = ["","","","",""]
        Cat5Q = ["","","","",""]
        Cat5A = ["","","","",""]
    }
    
    
}
