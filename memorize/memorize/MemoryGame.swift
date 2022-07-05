//
//  MemoryGame.swift
//  memorize
//
//  Created by Dmitry Kurski on 3.06.22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
  
  private(set) var cards: Array<Card>
  private var indexOfOneAndOnlyFaceUpCard: Int?
  
  mutating func choose(_ card: Card) {
    if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
      if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
        if cards[chosenIndex].content == cards[potentialMatchIndex].content {
          cards[chosenIndex].isMatched = true
          cards[potentialMatchIndex].isMatched = true
        }
        indexOfOneAndOnlyFaceUpCard = nil
      } else {
        for index in cards.indices {
          cards[index].isFaceUp = false
        }
        indexOfOneAndOnlyFaceUpCard = chosenIndex
      }
      
      cards[chosenIndex].isFaceUp.toggle()
    }
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
