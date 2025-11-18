//
//  Game.swift
//  TDD-iOS
//
//  Created by Mohamed Atallah on 17/11/2025.
//

import Foundation

class Game {
    
    private var rolled = Array(repeating: 0, count: 22)
    private var currentBall = 0
    
    func roll(_ pins: Int) {
        rolled[currentBall] = pins
        currentBall += 1
    }
    
    fileprivate func isStrike(_ thisBall: Int) -> Bool {
        return rolled[thisBall] == 10
    }
    
    fileprivate func isSpare(_ thisBall: Int) -> Int {
        return rolled[thisBall] + rolled[thisBall+1]
    }
    
    func scoreResult() -> Int {
        var score = 0
        var thisBall = 0
        for _ in 0..<10 {
            if isStrike(thisBall)
            {
                score += 10 + rolled[thisBall+1] + rolled[thisBall+2]
                thisBall += 1
                
            }
            else if isSpare(thisBall) == 10
            {
                score += 10 + rolled[thisBall+2]
                thisBall += 2
            } else {
                score += rolled[thisBall] + rolled[thisBall+1]
                thisBall += 2
            }
        }
        return score
    }
}
