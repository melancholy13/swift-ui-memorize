//
//  MemoryGame.swift
//  memorize
//
//  Created by Dmitry Kurski on 3.06.22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
  
  private(set) var cards: Array<Card>
  
  private var indexOfOneAndOnlyFaceUpCard: Int? {
    get { return cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
    set { cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue) } }
  }
  
  mutating func choose(_ card: Card) {
    if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
      if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
        if cards[chosenIndex].content == cards[potentialMatchIndex].content {
          cards[chosenIndex].isMatched = true
          cards[potentialMatchIndex].isMatched = true
        }
        cards[chosenIndex].isFaceUp = true
      } else {
        indexOfOneAndOnlyFaceUpCard = chosenIndex
      }
    }
  }
  
  init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
    cards = []
    
    for pairIndex in 0..<numberOfPairsOfCards {
      let content = createCardContent(pairIndex)
      cards.append(Card(id: pairIndex * 2, content: content))
      cards.append(Card(id: pairIndex * 2 + 1, content: content))
    }
  }
  
  struct Card: Identifiable {
    let id: Int
    var isFaceUp = false
    var isMatched = false
    let content: CardContent
  }
  
}
