//
//  Game.swift
//  BowlingGameKata
//
//  Created by Marino Meneghel on 3/31/16.
//  Copyright © 2016 Marino Meneghel. All rights reserved.
//

import Foundation
class Game {
    
    var scoreCounter: Int = 0
    var rolls = [Int]()
    
    func roll(pins: Int) {
        rolls.append(pins)
    }
    
    func score() -> Int {
        var result: Int = 0
        for roll in rolls {
            result += roll
        }
        return result
    }
    
}