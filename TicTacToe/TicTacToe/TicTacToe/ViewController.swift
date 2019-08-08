//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var ticTacToeBrainInstance = TicTacToeBrain()
    var playerInstance = Player.player1
    
    @IBOutlet weak var showWinner: UILabel!
    @IBOutlet var allButtons: [GameButton]!
    
    
    @IBAction func buttonPressed(_ sender: GameButton) {
        ticTacToeBrainInstance.updateGameBoard(player: playerInstance, row: sender.row, col: sender.col)
        let result = ticTacToeBrainInstance.checkGameState()
        switch result {
        case .player1wins:
            updateButtons(row: sender.row, col: sender.col, player: playerInstance)
            self.showWinner.text = "Player 1 Wins!"
            for buttons in allButtons {
                buttons.isEnabled = false
            }
            
        case .player2wins:
            updateButtons(row: sender.row, col: sender.col, player: playerInstance)
            self.showWinner.text = "Player 2 Wins!"
            for buttons in allButtons {
                buttons.isEnabled = false
            }
        case .ongoing:
            updateButtons(row: sender.row, col: sender.col, player: playerInstance)
            playerInstance.alternate()
        case .tie:
            self.showWinner.text = "Tie!"
            
            
        }
    }
   
    func updateButtons(row: Int, col: Int, player: Player) {
        for button in allButtons {
            if button.row == row && button.col == col {
                switch player {
                case .player1:
                    button.setTitle("O", for: .normal)
                    button.isEnabled = false
                    
                case .player2:
                    button.setTitle("X", for: .normal)
                    button.isEnabled = false
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func newGame(_ sender: GameButton) {
            for button in allButtons {
                if button.titleLabel?.text != nil {
                    button.setTitle("", for: .normal)
                    button.isEnabled = true
                    self.showWinner.text = ""
                }
            }
        }
    }
