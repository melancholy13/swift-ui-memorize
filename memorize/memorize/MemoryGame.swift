//
//  MemoryGame.swift
//  memorize
//
//  Created by Dmitry Kurski on 3.06.22.
//

import Foundation

public struct MemoryGame<CardContent> where CardContent: Equatable {
    
  private(set) var cards: Array<Card>
  
  private var indexOfOneAndOnlyFaceUpCard: Int? {
    get { return cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
    set { cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue) } }
  }
  
  init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
    cards = []
    
    for pairIndex in 0..<numberOfPairsOfCards {
      let content = createCardContent(pairIndex)
      cards.append(Card(id: pairIndex * 2, content: content))
      cards.append(Card(id: pairIndex * 2 + 1, content: content))
    }
    
    shuffle()
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
  
  mutating func shuffle() {
    cards.shuffle()
  }
  
  struct Card: Identifiable {
    let id: Int
    let content: CardContent
    
    var bonusTimeLimit: TimeInterval = 6
    var pastFaceUpTime: TimeInterval = 0
    var lastFaceUpDate: Date?
    
    var isFaceUp = false {
      didSet {
        if isFaceUp {
          startUsingBonusTime()
        } else {
          stopUsingBonusTime()
        }
      }
    }
    
    var isMatched = false {
      didSet {
        stopUsingBonusTime()
      }
    }
    
    var bonusTimeRemaining: Double {
      return max(0, bonusTimeLimit - faceUpTime)
    }
    
    var bonusRemaining: Double {
      return (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
    }
    
    var hasEarnedBonus: Bool {
      return isMatched && bonusTimeRemaining > 0
    }
    
    var isConsumingBonusTime: Bool {
      return isFaceUp && !isMatched && bonusTimeRemaining > 0
    }

    private var faceUpTime: TimeInterval {
      if let lastFaceUpDate = self.lastFaceUpDate {
        return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
      } else {
        return pastFaceUpTime
      }
    }
    
    private mutating func startUsingBonusTime() {
      if isConsumingBonusTime, lastFaceUpDate == nil {
        lastFaceUpDate = Date()
      }
    }
    
    private mutating func stopUsingBonusTime() {
      pastFaceUpTime = faceUpTime
      self.lastFaceUpDate = nil
    }
    
  }
  
}
