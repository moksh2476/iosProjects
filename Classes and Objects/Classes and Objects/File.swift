//
//  File.swift
//  Classes and Objects
//
//  Created by Moksh Modi on 6/11/19.
//  Copyright © 2019 Moksh Modi. All rights reserved.
//

import Foundation

enum CarType {
    case Sedan
    case Coupe
    case Hatchback
}

class Car
{
    var color = "black"
    var numofSeats = 5
    var typeofCar : CarType = .Hatchback
    init()
    {
        
    }
    
    convenience init(customerchosencolor: String) {
        self.init()
        color = customerchosencolor
    }
    func isdriving()
    {
        print("This should print that the car will be moving")
    }
}

class selfdriving : Car
{
    var destination: String?
    
    override func isdriving() {
        super.isdriving()
        if destination != nil
        {
        print("Now go back to \(destination!)")
        }
    }
}

