//
//  MemoryGameViewModel.swift
//  memorize
//
//  Created by Dmitry Kurski on 3.06.22.
//

import SwiftUI

class MemoryGameViewModel: ObservableObject {
  
  typealias Card = MemoryGame<String>.Card
  
  private static let content = ["😵‍💫", "👀", "😶‍🌫️", "😒", "☠️", "👻", "🤖", "🤡", "👽", "👺", "👹", "💩", "👿", "👾", "🤠", "👁"]
  
  private static func createMemoryGame() -> MemoryGame<String> {
    MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
      return content[pairIndex]
    }
  }
  
  @Published private var model = createMemoryGame()
  
  var cards: Array<Card> {
    return model.cards
  }
  
  func choose(_ card: Card) {
    model.choose(card)
  }
  
  func shuffle()  {
    model.shuffle()
  }
  
  func restart() {
    model = MemoryGameViewModel.createMemoryGame()
  }
  
}
