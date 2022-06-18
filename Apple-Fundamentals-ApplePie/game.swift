//
//  game.swift
//  Apple-Fundamentals-ApplePie
//
//  Created by Dmitriy Belokon on 11.06.2022.
//

import Foundation

struct Game{
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    var formattedWord: String{
        var guessedWord = ""
        for letter in word{
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
            }
            else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.contains(letter){
            incorrectMovesRemaining -= 1
        
        }
    }
}
