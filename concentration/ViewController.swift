//
//  ViewController.swift
//  concentration
//
//  Created by Oleg Sitnikov on 31.12.2019.
//  Copyright © 2019 Oleg Sitnikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    var flipCount = 0 {
        didSet {
            flipCountlabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountlabel: UILabel!

   
    @IBOutlet var cardButtons: [UIButton]!
      
    var emojiChoices = ["🎃", "👻", "🎃", "👻"]
    
    @IBAction func  touchCard(_ sender: UIButton) {
        flipCount += 1
        if  let cardNumber = cardButtons.firstIndex(of: sender) {
             
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            
        }
        
    }
    
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
                       button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        } 
    }
}

