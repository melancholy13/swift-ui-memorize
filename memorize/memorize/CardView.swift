//
//  CardView.swift
//  memorize
//
//  Created by Dmitry Kurski on 11.04.22.
//

import SwiftUI

struct CardView: View {
  
  @State var isFaceUp = true
  var content: String
  
  var body: some View {
    ZStack {
      let shape = RoundedRectangle(cornerRadius: 20)
      
      if isFaceUp {
        shape.fill().foregroundColor(.white)
        shape.stroke(lineWidth: 3)
        Text(content).font(.largeTitle)
      } else {
        shape.fill()
      }
    }.onTapGesture {
      isFaceUp.toggle()
    }
  }
}
