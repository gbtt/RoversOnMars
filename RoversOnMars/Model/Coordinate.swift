//
//  Coordinate.swift
//  RoversOnMars
//
//  Created by Giuseppe Bottiglieri on 01/02/18.
//  Copyright © 2018 gbtt. All rights reserved.
//

import Foundation

struct Coordinate {
    var x: Int
    var y: Int
    
    func inside(_ plateau: Plateau) -> Bool {
        return x >= 0 && y >= 0 && x <= plateau.width && y <= plateau.height
    }
}
