//
//  BowlingTests.swift
//  TDD-iOSTests
//
//  Created by Mohamed Atallah on 17/11/2025.
//

import XCTest
@testable import TDD_iOS

class BowlingTests: XCTestCase {
    private var sut: Game!
    
    override func setUp() {
        super.setUp()
        sut = Game()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    func test_rollZero_scoreShouldReturnZero() {
        sut.roll(0)
        
        XCTAssertEqual(sut.scoreResult(), 0)
    }
    
    func test_openFrameRoll2Then4_scoreShouldReturn6() {
        sut.roll(2)
        sut.roll(4)
        
        XCTAssertEqual(sut.scoreResult(), 6)
    }
    
    // Spare Add Next Ball
    func test_spareFrameRoll4Then6Then3Then0_scoreShouldReturn16() {
        sut.roll(4)
        sut.roll(6)
        sut.roll(3)
        sut.roll(0)
        
        XCTAssertEqual(sut.scoreResult(), 16)
    }
    
    func test_tenInTwoFramesIsNotASpare() {
        sut.roll(3)
        sut.roll(6)
        sut.roll(4)
        sut.roll(2)
        
        XCTAssertEqual(sut.scoreResult(), 15)
    }
    
    func test_strike_shouldAddNextTwoBalls() {
        sut.roll(10)
        sut.roll(3)
        sut.roll(2)
        
        XCTAssertEqual(sut.scoreResult(), 20)
    }
    
    func test_perfectGame_scoreShouldReturn300() {
        for _ in 0..<12 {
            sut.roll(10)
        }
        XCTAssertEqual(sut.scoreResult(), 300)
    }
}
