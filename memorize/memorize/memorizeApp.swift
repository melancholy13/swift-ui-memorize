//
//  memorizeApp.swift
//  memorize
//
//  Created by Dmitry Kurski on 10.04.22.
//

import SwiftUI

@main
struct memorizeApp: App {
  
  private let viewModel = MemoryGameViewModel()
  
  var body: some Scene {
    WindowGroup {
      MemoryGameView(viewModel: viewModel)
    }
  }
  
}
