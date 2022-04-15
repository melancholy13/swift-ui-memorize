//
//  ContentView.swift
//  memorize
//
//  Created by Dmitry Kurski on 10.04.22.
//

import SwiftUI

struct ContentView: View {
  
  var content = ["😵‍💫", "👀", "😶‍🌫️"]
  
  var body: some View {
    HStack {
      ForEach(content, id: \.self) { element in
        CardView(content: element)
      }
    }
    .foregroundColor(.red)
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
