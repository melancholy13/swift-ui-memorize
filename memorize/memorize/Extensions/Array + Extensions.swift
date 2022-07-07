//
//  Array + Extensions.swift
//  memorize
//
//  Created by Dmitry Kurski on 7.07.22.
//

import Foundation

extension Array {
  
  var oneAndOnly: Element? {
    return count == 1 ? first : nil
  }
  
}
