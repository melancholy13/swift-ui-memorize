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
      Spacer()
      HStack {
        removeButton
        Spacer()
        addButton
      }
      .font(.largeTitle)
      .padding(.horizontal)
    }
    .padding(.horizontal)
  }
  
  var removeButton: some View {
    Button(action: {
      if contentCount > 1 {
        contentCount -= 1
      }
    }, label: {
      Image(systemName: "minus.circle")
    })
  }
  
  var addButton: some View {
    Button(action: {
      if contentCount < content.count {
        contentCount += 1
      }
    }, label: {
      Image(systemName: "plus.circle")
    })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
      .previewInterfaceOrientation(.portrait)
  }
}
