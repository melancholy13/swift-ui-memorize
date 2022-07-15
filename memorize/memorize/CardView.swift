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
        PieShape(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: 110 - 90))
          .padding(6)
          .opacity(DrawingConstants.timeTrackerOpacity)
        Text(card.content).font(font(in: geometry.size))
      }
      .cardify(isFaceUp: card.isFaceUp)
    })
  }
  
  private func font(in size: CGSize) -> Font {
    return Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
  }
  
}
