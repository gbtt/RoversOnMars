//
//  Rover.swift
//  RoversOnMars
//
//  Created by Giuseppe Bottiglieri on 01/02/18.
//  Copyright © 2018 gbtt. All rights reserved.
//

import Foundation

class Rover {
    var coords: Coordinate!
    var facing: Facing!
    var plateau: Plateau?
    
    init(coords: Coordinate, facing: Facing) {
        self.coords = coords
        self.facing = facing
    }
    
    func setPlateau(_ plateau: Plateau) {
        self.plateau = plateau
    }
    
    func move(moviments: String) {
        for c in moviments {
            if c == Moviment.rotateLeft {
                turnLeft()
            } else if c == Moviment.rotateRight {
                turnRight()
            } else if c == Moviment.forward {
                forward()
            } else {
                print("what is \(c)?")
            }
        }
    }
    
    func turnRight() {
        if facing == .W {
            facing = .N
        } else {
            facing = Facing(rawValue: facing.rawValue+1)!
        }
    }
    
    func turnLeft() {
        if facing == .N {
            facing = .W
        } else {
            facing = Facing(rawValue: facing.rawValue-1)!
        }
    }
    
    func forward() {
        switch facing {
        case .N: coords.y+=1
        case .E: coords.x+=1
        case .S: coords.y-=1
        case .W: coords.x-=1
        default: break
        }
        
        checkPlateau()
    }
    
    func checkPlateau() {
        if plateau == nil { return }
        
        if coords.y > plateau!.height || coords.y < 0 || coords.x > plateau!.width || coords.x < 0 {
            print("warning... outside of plateau!")
        }
    }
    
    var position: String {
        var f = ""
        switch facing {
        case .N: f = "N"
        case .E: f = "E"
        case .S: f = "S"
        case .W: f = "W"
        default: break
        }
        
        return "\(coords.x) \(coords.y) \(f)"
    }
}
