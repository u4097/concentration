//
//  ViewController.swift
//  concentration
//
//  Created by Oleg Sitnikov on 31.12.2019.
//  Copyright © 2019 Oleg Sitnikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    private  var numberOfPairsOfCards: Int {
        get {
            return (cardButtons.count + 1) / 2
        }
    }
    
   private(set) var flipCount = 0 {
    didSet {
            flipCountlabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountlabel: UILabel!
    
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    private var emojiChoices = ["🎃", "🐉", "🧚‍♀️", "🦞", "🌲", "🍄", "🍏", "🧬", "💈", "🎁", "🧸", "🧪", "🖼", "💊", "🔮", "🔭", "🧿", "🧹", "🛌", "🪑", "🚪"]
    
  private  var emoji = [Int: String]()
    
   private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    @IBAction private func  touchCard(_ sender: UIButton) {
        flipCount += 1
        if  let cardNumber = cardButtons.firstIndex(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("choosen card was not in cardButtons")
        }
        
    }
    
   private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0): #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            } 
            
        }
    }
    
   private func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        } 
    }
}

