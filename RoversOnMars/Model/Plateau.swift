//
//  Plateau.swift
//  RoversOnMars
//
//  Created by Giuseppe Bottiglieri on 01/02/18.
//  Copyright © 2018 gbtt. All rights reserved.
//

import Foundation

struct Plateau {
    var width: Int
    var height: Int
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
    
    func isValid() -> Bool {
        return width > 0 && height > 0
    }
    
    static func setup(_ s: String) -> Plateau? {
        let values = s.split(separator: "x")
        if values.count == 2 {
            if let first = Int(values[0]), let second = Int(values[1]) {
                return Plateau(width: first, height: second)
            }
        }
        return nil
    }
}
