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
    var Q200: [String]?
    var Q400: [String]?
    var Q600: [String]?
    var Q800: [String]?
    var Q1000: [String]?
    var A200: [String]?
    var A400: [String]?
    var A600: [String]?
    var A800: [String]?
    var A1000: [String]?
    var TwoPlayer : Bool
    var Player1Score : Int
    var Player2Score : Int
    
    init(name: String, twoPlayer : Bool)
    {
        GameName = name
        TwoPlayer = twoPlayer
        Player1Score = 0
        Player2Score = 0
    }
    
    
}
