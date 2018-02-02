//
//  Moviment.swift
//  RoversOnMars
//
//  Created by Giuseppe Bottiglieri on 01/02/18.
//  Copyright © 2018 gbtt. All rights reserved.
//

import Foundation

struct Moviment {
    static let rotateLeft: Character = "L"
    static let rotateRight: Character = "R"
    static let forward: Character = "M"
    
    static func setup(_ s: String) -> String {
        for c in s.trimmingCharacters(in: .whitespaces) {
            if c != rotateLeft && c != rotateRight && c != forward {
                return ""
            }
        }
        return s
    }
}
