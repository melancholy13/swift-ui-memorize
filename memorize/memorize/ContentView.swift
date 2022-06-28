//
//  ContentView.swift
//  memorize
//
//  Created by Dmitry Kurski on 10.04.22.
//

import SwiftUI

struct ContentView: View {
  
  var content = ["😵‍💫", "👀", "😶‍🌫️", "😒", "☠️", "👻", "🤖", "🤡", "👽", "👺", "👹", "💩", "👿", "👾", "🤠", "👁"]
  
  @State var contentCount = 6
  
  var body: some View {
    VStack {
      ScrollView {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
          ForEach(content[0..<contentCount], id: \.self) { element in
            CardView(content: element).aspectRatio(2/3, contentMode: .fit)
          }
        }
      }
      .foregroundColor(.red)
    }
    .padding(.horizontal)
  } 
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
      .previewInterfaceOrientation(.portrait)
  }
}
