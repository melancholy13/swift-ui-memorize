//
//  MemoryGame.swift
//  memorize
//
//  Created by Dmitry Kurski on 3.06.22.
//

import Foundation

struct MemoryGame<CardContent> {
  
  private(set) var cards: Array<Card>
  
  mutating func choose(_ card: Card) {
    let chosenIndex = index(of: card)
    cards[chosenIndex].isFaceUp.toggle()
  }
  
  func index(of card: Card) -> Int {
    for index in 0..<cards.count {
      if cards[index].id == card.id {
        return index
      }
    }
    
    return 0
  }
  
  init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
    cards = Array<Card>()
    
    for pairIndex in 0..<numberOfPairsOfCards {
      let content = createCardContent(pairIndex)
      cards.append(Card(id: pairIndex * 2, content: content))
      cards.append(Card(id: pairIndex * 2 + 1, content: content))
    }
  }
  
  struct Card: Identifiable {
    var id: Int
    var isFaceUp = false
    var isMatched = false
    var content: CardContent
  }
  
}
