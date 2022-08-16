//
//  MemoryGameView.swift
//  memorize
//
//  Created by Dmitry Kurski on 10.04.22.
//

import SwiftUI

struct MemoryGameView: View {
  
  @ObservedObject var viewModel: MemoryGameViewModel
  @Namespace private var dealingNamespace
  @State private var dealt = Set<Int>()
  
  var body: some View {
    ZStack(alignment: .bottom) {
      VStack {
        gameBody
        HStack {
          restartButton
          Spacer()
          shuffleButton
        }
        .padding(.horizontal)
      }
      deckBody
    }
    .padding()
  }
  
  var gameBody: some View {
    AspectVGrid(items: viewModel.cards, aspectRatio: 2/3, content: { card in
      cardView(for: card)
    })
    .foregroundColor(CardConstants.color)
  }
  
  var deckBody: some View {
    ZStack {
      ForEach(viewModel.cards.filter(isUndealt)) { card in
        CardView(card)
          .matchedGeometryEffect(id: card.id, in: dealingNamespace)
          .transition(.asymmetric(insertion: .opacity, removal: .identity))
          .zIndex(zIndex(of: card))
      }
    }
    .frame(width: CardConstants.undealtWidth, height: CardConstants.undealtHeight)
    .foregroundColor(CardConstants.color)
    .onTapGesture {
      for card in viewModel.cards {
        withAnimation(dealAnimation(for: card)) {
          deal(card)
        }
      }
    }
  }
  
  var shuffleButton: some View {
    Button("Shuffle") {
      withAnimation {
        viewModel.shuffle()
      }
    }
  }
  
  var restartButton: some View {
    Button("Restart") {
      withAnimation {
        dealt = []
        viewModel.restart()
      }
    }
  }
  
  @ViewBuilder
  private func cardView(for card: MemoryGameViewModel.Card) -> some View {
    if isUndealt(card) || card.isMatched && !card.isFaceUp {
      Color.clear
    } else {
      CardView(card)
        .matchedGeometryEffect(id: card.id, in: dealingNamespace)
        .padding(4)
        .transition(.asymmetric(insertion: .identity, removal: .scale))
        .zIndex(zIndex(of: card))
        .onTapGesture {
          withAnimation {
            viewModel.choose(card)
          }
        }
    }
  }
  
  private func deal(_ card: MemoryGame<String>.Card) {
    dealt.insert(card.id)
  }
  
  private func isUndealt(_ card: MemoryGame<String>.Card) -> Bool {
    return !dealt.contains(card.id)
  }
  
  private func dealAnimation(for card: MemoryGame<String>.Card) -> Animation {
    var delay = 0.0
    
    if let index = viewModel.cards.firstIndex(where: { $0.id == card.id }) {
      delay = Double(index) * (CardConstants.totalDealDuration / Double(viewModel.cards.count))
    }
    
    return Animation.easeInOut(duration: CardConstants.dealDuration).delay(delay)
  }
  
  private func zIndex(of card: MemoryGame<String>.Card) -> Double {
    return -Double(viewModel.cards.firstIndex(where: { $0.id == card.id }) ?? 0)
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
