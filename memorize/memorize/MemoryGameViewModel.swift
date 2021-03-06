//
//  MemoryGameViewModel.swift
//  memorize
//
//  Created by Dmitry Kurski on 3.06.22.
//

import SwiftUI

class MemoryGameViewModel: ObservableObject {
  
  typealias Card = MemoryGame<String>.Card
  
  private static let content = ["π΅βπ«", "π", "πΆβπ«οΈ", "π", "β οΈ", "π»", "π€", "π€‘", "π½", "πΊ", "πΉ", "π©", "πΏ", "πΎ", "π€ ", "π"]
  
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
  
}
