//
//  Planet.swift
//  MySolarSystem
//
//  Created by Joseph Anthony Castillon on 7/13/18.
//  Copyright © 2018 Joseph Anthony Castillon. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

class Planet {
    
    var radius : Float
    var textureFile : String
    var nodePosition : SCNVector3
    
    var name : String
    var zpos : Float
    
    init(){
        radius = 1.0
        textureFile = ""
        nodePosition = SCNVector3(x: 0.0, y: 0.0, z: -1.0)
        name = ""
        zpos = -1.0;
    }
    
    convenience init(name: String , radius : Float, textureFile : String, zpos: Float){
        self.init()
        
        self.radius = radius
        self.name = name
        self.textureFile = textureFile
        self.zpos = zpos
    }
    
    
}
