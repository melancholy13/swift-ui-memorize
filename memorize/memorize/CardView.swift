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
    GeometryReader(content: { geometry in
      ZStack {
        let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
        
        if card.isFaceUp {
          shape.fill().foregroundColor(.white)
          shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
          Text(card.content).font(font(in: geometry.size))
        } else if card.isMatched {
          shape.opacity(0)
        } else {
          shape.fill()
        }
      }
    })
  }
  
  private func font(in size: CGSize) -> Font {
    return Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
  }
}
