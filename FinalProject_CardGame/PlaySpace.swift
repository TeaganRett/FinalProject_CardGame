//
//  PlaySpace.swift
//  FinalProject_CardGame
//
//  Created by Tiger Coder on 12/8/20.
//  Copyright © 2020 Tiger Coder. All rights reserved.
//

import UIKit

class PlaySpace: UIViewController {
    @IBOutlet weak var plainPlayerCard: UIImageView!
    @IBOutlet weak var topPlayerNumber: UILabel!
    @IBOutlet weak var bottomPlayerNumber: UILabel!
    @IBOutlet weak var playerDiamond: UIImageView!
    @IBOutlet weak var playerHeart: UIImageView!
    @IBOutlet weak var playerSpade: UIImageView!
    @IBOutlet weak var playerClub: UIImageView!
    @IBOutlet weak var starterCard: UIImageView!
    @IBOutlet weak var numCardsPlayerLabel: UILabel!
    @IBOutlet weak var numCardsCompLabel: UILabel!
    
    
    @IBOutlet weak var plainCompCard: UIImageView!
    @IBOutlet weak var topCompNumber: UILabel!
    @IBOutlet weak var bottomCompNumber: UILabel!
    @IBOutlet weak var compDiamond: UIImageView!
    @IBOutlet weak var compHeart: UIImageView!
    @IBOutlet weak var compSpade: UIImageView!
    @IBOutlet weak var compClub: UIImageView!
    @IBOutlet weak var starterCard2: UIImageView!
    
    var playingDeck: DeckOfCards!
    var playerCards = 0
    var compCards = 0
    var tieCards = 0
 override func viewDidLoad() {
     super.viewDidLoad()
     // Do any additional setup after loading the view.
    playingDeck = DeckOfCards()
 }

    
    @IBAction func goButton(_ sender: UIButton) {
        var playerNum: Int = 0
        var compNum: Int = 0
        var tempTuple: (Int, suit2)
        plainPlayerCard.isHidden = false
        plainCompCard.isHidden = false
        starterCard.isHidden = true
        starterCard2.isHidden = true
        playerHeart.isHidden = true
        playerDiamond.isHidden = true
        playerClub.isHidden = true
        playerSpade.isHidden = true

        tempTuple = playingDeck.drawACard()
        playerNum = tempTuple.0
        topPlayerNumber.text = "\(tempTuple.0)"
        bottomPlayerNumber.text = "\(tempTuple.0)"
        
        switch tempTuple.1 {
        case .hearts:
            playerHeart.isHidden = false
        case .diamonds:
            playerDiamond.isHidden = false
        case .clubs:
            playerClub.isHidden = false
        case .spades:
            playerSpade.isHidden = false
        default:
            print("") //nothing
        }
            compClub.isHidden = true
            compSpade.isHidden = true
            compHeart.isHidden = true
            compDiamond.isHidden = true
        
             tempTuple = playingDeck.drawACard()
        compNum = tempTuple.0
            topCompNumber.text = "\(tempTuple.0)"
            bottomCompNumber.text = "\(tempTuple.0)"
        
            switch tempTuple.1 {
            case .hearts:
                compHeart.isHidden = false
            case .diamonds:
                compDiamond.isHidden = false
            case .clubs:
                compClub.isHidden = false
            case .spades:
                compSpade.isHidden = false
        }

        if (playerNum == compNum) {
            tieCards += 2
        }
        else if ( playerNum > compNum) {
            playerCards += (2+tieCards)
            tieCards = 0
            numCardsPlayerLabel.text = "Number Of Cards Collected \(playerCards)/52"
        }
        else {
            compCards += (2 + tieCards)
            tieCards = 0
            numCardsCompLabel.text = "Number Of Cards Collected \(compCards)/52"
        }
    

   

}
}
