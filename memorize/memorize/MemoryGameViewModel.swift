//
//  MemoryGameViewModel.swift
//  memorize
//
//  Created by Dmitry Kurski on 3.06.22.
//

import SwiftUI

class MemoryGameViewModel: ObservableObject {
  
  static let content = ["😵‍💫", "👀", "😶‍🌫️", "😒", "☠️", "👻", "🤖", "🤡", "👽", "👺", "👹", "💩", "👿", "👾", "🤠", "👁"]
  
  static func createMemoryGame() -> MemoryGame<String> {
    MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
      return content[pairIndex]
    }
  }
  
  @Published private var model: MemoryGame<String> = createMemoryGame()
  
  var cards: Array<MemoryGame<String>.Card> {
    return model.cards
  }
  
  func choose(_ card: MemoryGame<String>.Card) {
    model.choose(card)
  }
  
}
