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
    ScrollView {
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
        ForEach(viewModel.cards) { card in
          CardView(card).aspectRatio(2/3, contentMode: .fit).onTapGesture {
            viewModel.choose(card)
          }
        }
      }
    }
    .foregroundColor(.red)
    .padding(.horizontal)
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
