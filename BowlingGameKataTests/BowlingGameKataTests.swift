 //
//  BowlingGameKataTests.swift
//  BowlingGameKataTests
//
//  Created by Marino Meneghel on 3/31/16.
//  Copyright © 2016 Marino Meneghel. All rights reserved.
//

import XCTest
@testable import BowlingGameKata

class BowlingGameKataTests: XCTestCase {
    
    let game: Game = Game()
    
    
    func testGutterGame() {
        playGame(20, pins: 0)
        XCTAssertEqual(0, game.score())
    }
    
    func testAllOnes() {
        playGame(20, pins: 1)
        XCTAssertEqual(20, game.score())
    }
    
    func testSingleSpare() {
        game.roll(4)
        game.roll(6)
        game.roll(3)
        playGame(17, pins: 1)
        XCTAssertEqual(33, game.score())
    }
    
    
    func playGame(rolls: Int, pins: Int) {
        for _ in 1...rolls {
            game.roll(pins)
        }
    }
}
