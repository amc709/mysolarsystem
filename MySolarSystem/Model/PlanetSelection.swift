//
//  PlanetSelection.swift
//  MySolarSystem
//
//  Created by Joseph Anthony Castillon on 7/17/18.
//  Copyright © 2018 Joseph Anthony Castillon. All rights reserved.
//

import Foundation

class PlanetSelection {
    
    var planetName : String
    var iconFile : String
    var selected : Bool = false
    
    init() {
        self.planetName = ""
        self.iconFile = ""
    }
    
    convenience init(planetName : String, iconFile : String) {
        self.init()
        
        self.planetName = planetName
        self.iconFile = iconFile
    }
}
