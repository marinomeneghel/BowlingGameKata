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
        game.roll(4)
        game.roll(6)
        game.roll(3)
        rollMany(times: 17, pins: 1)
        XCTAssertEqual(33, game.score())
    }
    
    func testOneStrike() {
        game.roll(10)
        game.roll(3)
        game.roll(4)
        rollMany(times: 16, pins: 0)
        XCTAssertEqual(24, game.score())
    }
    
//    func testStrikeAndSpare() {
//        game.roll(10)
//        game.roll(5)
//        game.roll(4)
//        game.roll(3)
//        rollMany(times: 16, pins: 1)
//        XCTAssertEqual(52, game.score())
//    }
    
    func rollMany(times rolls: Int, pins: Int) {
        for _ in 1...rolls {
            game.roll(pins)
        }
    }
}
