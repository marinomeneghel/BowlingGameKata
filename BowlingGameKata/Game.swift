//
//  Game.swift
//  BowlingGameKata
//
//  Created by Marino Meneghel on 3/31/16.
//  Copyright © 2016 Marino Meneghel. All rights reserved.
//

import Foundation
class Game {
    
    private var scoreCounter: Int = 0
    private var rolls = [Int](count: 21, repeatedValue: 0)
    private var currentRoll = 0
    
    func roll(pins: Int) {
        rolls[currentRoll] = pins
        currentRoll += 1
    }
    
    func score() -> Int {
        var result = 0
        var i = 0
        for _ in 1...10 {
            let rollsSum = rolls[i] + rolls[i+1]
            result += rollsSum
            if (rollsSum == 10) {
                result += rolls[i+2]
            }
            i += 2
        }
        return result
    }
    
}