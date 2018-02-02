//
//  Facing.swift
//  RoversOnMars
//
//  Created by Giuseppe Bottiglieri on 01/02/18.
//  Copyright © 2018 gbtt. All rights reserved.
//

import Foundation

enum Facing: Int {
    case N = 0
    case E = 1
    case S = 2
    case W = 3
    
    static func setup(_ head: String) -> Facing? {
        if head == "N" {
            return Facing.N
        }
        if head == "S" {
            return Facing.S
        }
        if head == "E" {
            return Facing.E
        }
        if head == "W" {
            return Facing.W
        }
        
        return nil
    }
}
