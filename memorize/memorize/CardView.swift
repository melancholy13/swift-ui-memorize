//
//  CardView.swift
//  memorize
//
//  Created by Dmitry Kurski on 11.04.22.
// 

import SwiftUI

struct CardView: View {
  
  private let card: MemoryGameViewModel.Card
  
  init(_ card: MemoryGameViewModel.Card) {
    self.card = card
  }
  
  var body: some View {
    ZStack {
      let shape = RoundedRectangle(cornerRadius: 20)
      
      if card.isFaceUp {
        shape.fill().foregroundColor(.white)
        shape.strokeBorder(lineWidth: 3)
        Text(card.content).font(.largeTitle)
      } else if card.isMatched {
        shape.opacity(0)
      } else {
        shape.fill()
      }
    }
  }
}
