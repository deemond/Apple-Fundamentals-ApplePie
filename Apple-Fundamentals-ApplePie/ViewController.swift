//
//  ViewController.swift
//  Apple-Fundamentals-ApplePie
//
//  Created by Dmitriy Belokon on 11.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    var listOfWords = ["bucaneer","swift","glorious","incandescent","bug","program"]
    let incorrectMovesAloowed = 7
    var totalWins = 0 {didSet{newRound()}}
    var totalLoses = 0 {didSet{newRound()}}
    var currentGame: Game!
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
    
        updateGameState()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    
    func newRound(){
        if !listOfWords.isEmpty{
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAloowed, guessedLetters: [])
            enableLetterButton(true)
            updateUI()
            
        }else{
        enableLetterButton(false)
        }
    }
    
    func updateUI(){
        //var letters = [String]()
        //let letters=currentGame.formattedWord.map{$0.lowercased()}
        // это для проверки гитхаба
        correctWordLabel.text = currentGame.formattedWord.map{$0.lowercased()}.joined(separator: " ")
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLoses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    
    func updateGameState(){
        if currentGame.incorrectMovesRemaining==0{
            totalLoses+=1
        }else if currentGame.word==currentGame.formattedWord{
            totalWins+=1
        }else{
            updateUI()
        }
    }
    
    func enableLetterButton(_ enable:Bool){
        for button in letterButtons{
            button.isEnabled = enable
        }
    }
    
    
}

