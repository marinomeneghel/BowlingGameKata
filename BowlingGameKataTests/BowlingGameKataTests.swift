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
    
    var game: Game!
    
    override func setUp() {
        game = Game()
    }
    
    override func tearDown() {
        game = nil
    }
    
    func testGutterGame() {
        rollMany(times: 20, pins: 0)
        XCTAssertEqual(0, game.score())
    }
    
    func testAllOnes() {
        rollMany(times: 20, pins: 1)
        XCTAssertEqual(20, game.score())
    }
    
    func testSingleSpare() {
        rollSpare()
        game.roll(3)
        rollMany(times: 17, pins: 1)
        XCTAssertEqual(33, game.score())
    }
    
    func testOneStrike() {
        rollStrike()
        game.roll(3)
        game.roll(4)
        rollMany(times: 16, pins: 0)
        XCTAssertEqual(24, game.score())
    }
    
    func testStrikeAndSpare() {
        rollStrike()
        rollSpare()
        game.roll(3)
        game.roll(2)
        rollMany(times: 14, pins: 0)
        XCTAssertEqual(38, game.score())
    }
    
    func testAllStrikes() {
        rollMany(times: 12, pins: 10)
        XCTAssertEqual(300, game.score())
    }
    
    func rollStrike() {
        game.roll(10)
    }
    
    func rollSpare() {
        game.roll(4)
        game.roll(6)
    }
    
    func rollMany(times rolls: Int, pins: Int) {
        for _ in 1...rolls {
            game.roll(pins)
        }
    }
}
