//
//  CardView.swift
//  memorize
//
//  Created by Dmitry Kurski on 11.04.22.
// 

import SwiftUI

struct CardView: View {
  
  private let card: MemoryGameViewModel.Card
  
  @State private var animatedBonusRemaining: Double = 0
  
  init(_ card: MemoryGameViewModel.Card) {
    self.card = card
  }
  
  var body: some View {
    GeometryReader(content: { geometry in
      ZStack {
        Group {
          if card.isConsumingBonusTime {
            PieShape(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: (1 - animatedBonusRemaining) * 360 - 90))
              .onAppear() {
                animatedBonusRemaining = card.bonusRemaining
                withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                  animatedBonusRemaining = 0
                }
              }
          } else {
            PieShape(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: (1 - card.bonusRemaining) * 360 - 90))
          }
        }
        .padding(6)
        .opacity(DrawingConstants.timeTrackerOpacity)
        
        Text(card.content)
          .rotationEffect(Angle(degrees: card.isMatched ? 360 : 0))
          .animation(Animation.easeInOut(duration: 2), value: card.isMatched)
          .font(Font.system(size: DrawingConstants.fontSize))
          .scaleEffect(scale(thatFits: geometry.size))
      }
      .cardify(isFaceUp: card.isFaceUp)
    })
  }
  
  private func scale(thatFits size: CGSize) -> CGFloat {
    min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
  }
  
}
