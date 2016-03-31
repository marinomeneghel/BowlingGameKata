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
        var ballIndex = 0
        for _ in 1...10 {
            let rollsSum = rolls[ballIndex] + rolls[ballIndex+1]
            if isSpare(rollsSum) {
                result += rolls[ballIndex+2]
            
            } else if isStrike(ballIndex) {
                result += rolls[ballIndex+1] + rolls[ballIndex + 2]
            }
            result += rollsSum
            ballIndex += 2
        }
        return result
    }
    
    func isStrike(ballIndex: Int) -> Bool {
        return rolls[ballIndex] == 10
    }
    
    func isSpare(points: Int) -> Bool {
        return points == 10
    }
    
}