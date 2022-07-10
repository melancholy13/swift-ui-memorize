//
//  MemoryGameView.swift
//  memorize
//
//  Created by Dmitry Kurski on 10.04.22.
//

import SwiftUI

struct MemoryGameView: View {
  
  @ObservedObject var viewModel: MemoryGameViewModel
  
  var body: some View {
    AspectVGrid(items: viewModel.cards, aspectRatio: 2/3, content: { card in
      cardView(for: card)
    })
    .foregroundColor(.red)
    .padding(.horizontal)
  }
  
  @ViewBuilder 
  private func cardView(for card: MemoryGameViewModel.Card) -> some View {
    if card.isMatched && !card.isFaceUp {
      Rectangle().opacity(0)
    } else {
      CardView(card).padding(4).onTapGesture {
        viewModel.choose(card)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = MemoryGameViewModel()
    
    MemoryGameView(viewModel: viewModel)
      .preferredColorScheme(.dark)
      .previewInterfaceOrientation(.portrait)
  }
}
