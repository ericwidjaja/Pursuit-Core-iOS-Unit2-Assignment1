//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class TicTacToeBrain {
    
    var gameboard = [["-", "-", "-"], //row 0
        ["-", "-", "-"], //row 1
        ["-", "-", "-"]] //row 2
    
    
    
    func updateGameBoard(player: Player, row: Int, col: Int) {
        switch player {
        case .player1:
            gameboard[row][col] = "O"
        case .player2:
            gameboard[row][col] = "X"
        }
    }
    
    func checkGameState() -> GameState {
        //horizontal check
        for row in gameboard {
            if row == ["O", "O", "O"] {
                return .player1wins
            }
        }
        
        //vertical check
        for columnIndex in 0..<gameboard[0].count {
            var column = [String]()
            for rowIndex in 0..<gameboard.count {
                column.append(gameboard[rowIndex][columnIndex])
            }
            if column == ["O", "O", "O"] {
                return .player1wins
            } else if column == ["X", "X", "X"] {
                return .player2wins
            }
        }
        
        
        //diagonal check
        var diagonal1 = [String]()
        var diagonal2 = [String]()
        for i in 0..<gameboard.count {
            diagonal1.append(gameboard[i][i])
            diagonal2.append(gameboard[i][gameboard.count-1 - i])
        }
        if diagonal1 == ["O", "O", "O"] || diagonal2 == ["X", "X", "X"] {
            return .player1wins
        } else if diagonal1 == ["X", "X", "X"] || diagonal2 == ["O", "O", "O"] {
            return .player2wins
        }
        return .ongoing
    }
}

