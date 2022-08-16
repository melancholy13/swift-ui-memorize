//
//  Constants.swift
//  memorize
//
//  Created by Dmitry Kurski on 8.07.22.
//

import Foundation
import UIKit
import SwiftUI

struct DrawingConstants {
  static let cornerRadius: CGFloat = 10
  static let lineWidth: CGFloat = 3
  static let fontScale: CGFloat = 0.75
  static let fontSize: CGFloat = 32
  static let timeTrackerOpacity: CGFloat = 0.5
}

struct CardConstants {
  static let color = Color.red
  static let apectRatio: CGFloat = 2/3
  static let dealDuration: Double = 0.5
  static let totalDealDuration: Double = 2
  static let undealtHeight: CGFloat = 90
  static let undealtWidth = undealtHeight * apectRatio
}
