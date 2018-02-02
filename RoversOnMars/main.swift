//
//  main.swift
//  RoversOnMars
//
//  Created by Giuseppe Bottiglieri on 01/02/18.
//  Copyright © 2018 gbtt. All rights reserved.
//

import Foundation

private let fileName = "input.txt"

private func setupFacing(_ s: String) -> (Coordinate?, Facing?) {
    let values = s.split(separator: " ")
    if values.count == 3 {
        if let x = Int(values[0]), let y = Int(values[1]) {
            let head = String(values[2])
            return (Coordinate(x: x, y: y), Facing.setup(head))
        }
    }
    return (nil, nil)
}

var fileContent = String.readInputFile(fileName: fileName)

if let rows = fileContent?.split(separator: "\n"), rows.count > 0 {
    let plateau = Plateau.setup(String(rows[0]))
    
    if plateau == nil && !plateau!.isValid() {
        print("no valid data for plateau")
        exit(-1)
    }
    
    var i = 1
    while i < rows.count {
        let (coordinates, facing) = setupFacing(String(rows[i]))
        let moviments = Moviment.setup(String(rows[i+1]))
        i+=2
        
        if coordinates == nil {
            print("no valid data for coordinates")
            exit(-2)
        }
        
        if facing == nil {
            print("no valid data for facing")
            exit(-3)
        }
        
        if moviments.isEmpty {
            print("no valid data")
            exit(-4)
        }
        
        //Check if the rover position is inside the plateau
        if !coordinates!.inside(plateau!) {
            print("Rover lost somewhere")
        } else {
            let rover = Rover(coords: coordinates!, facing: facing!)
            rover.setPlateau(plateau!)
            rover.move(moviments: moviments)
            print(rover.position)
        }
    }
} else {
    print("Error: no input file found, or file is empty")
}
