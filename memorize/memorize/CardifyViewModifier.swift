//
//  CardifyViewModifier.swift
//  memorize
//
//  Created by Dmitry Kurski on 15.07.22.
//

import SwiftUI

struct CardifyViewModifier: ViewModifier {
  
  var isFaceUp = false
  
  func body(content: Content) -> some View {
    ZStack {
      let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
      if isFaceUp {
        shape.fill().foregroundColor(.white)
        shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
      } else {
        shape.fill()
      }
      content.opacity(isFaceUp ? 1 : 0)
    }
  }
  
}

extension View {
  
  func cardify(isFaceUp: Bool) -> some View {
    return self.modifier(CardifyViewModifier(isFaceUp: isFaceUp))
  }
  
}
