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
    
    var Cat1: [Bool]?
    var Cat2: [Bool]?
    var Cat3: [Bool]?
    var Cat4: [Bool]?
    var Cat5: [Bool]?
    
    var numPushed : Int
    
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
        
        numPushed = 0
        Cat1 = [false,false,false,false,false]
        Cat2 = [false,false,false,false,false]
        Cat3 = [false,false,false,false,false]
        Cat4 = [false,false,false,false,false]
        Cat5 = [false,false,false,false,false]
        
    }
    
    
}
