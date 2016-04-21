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
        var score = 0
        var frameIndex = 0
        for _ in 1...10 {
            if isStrike(frameIndex) {
                score += 10 + strikeBonus(frameIndex)
                frameIndex += 1
                
            } else if isSpare(frameIndex) {
                score += 10 + spareBonus(frameIndex)
                frameIndex += 2
                
            } else {
                score += rolls[frameIndex] + rolls[frameIndex+1]
                frameIndex += 2
            }
        }
        return score
    }
    
    func isStrike(frameIndex: Int) -> Bool {
        return rolls[frameIndex] == 10
    }
    
    func isSpare(frameIndex: Int) -> Bool {
        return rolls[frameIndex] + rolls[frameIndex + 1] == 10
    }
    
    private func strikeBonus(frameIndex: Int) -> Int {
        return rolls[frameIndex+1] + rolls[frameIndex+2]
    }
    
    private func spareBonus(frameIndex: Int) -> Int {
        return rolls[frameIndex+2]
    }
    
}