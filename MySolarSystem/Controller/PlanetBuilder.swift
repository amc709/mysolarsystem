//
//  PlanetBuilder.swift
//  MySolarSystem
//
//  Created by Joseph Anthony Castillon on 7/13/18.
//  Copyright © 2018 Joseph Anthony Castillon. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

class PlanetBuilder {
    
    func buildPlanet(sceneView: ARSCNView, planet : Planet, zpos : Float){
        
        let spaceObj = SCNSphere(radius: CGFloat(planet.radius))
        
        let material = SCNMaterial()
        
        
        material.diffuse.contents = UIImage(named: planet.textureFile)
        spaceObj.materials = [material]
        
        let node = SCNNode()
        node.position = createNodePosition(zpos: zpos)
        
        node.geometry = spaceObj
        
        sceneView.scene.rootNode.addChildNode(node)
    }

    
    func generateRandomCoordinate(max : Int) -> Float{
        let rand_x = Float(arc4random_uniform(UInt32(max)))
        return (Float(max/2) - rand_x)
    }
    
    func generateZPosDirection(zpos : Float) -> Float {
        let rand = Int(arc4random_uniform(100))
        return (rand <= 50) ? -zpos : zpos
    }
    
    
    func createNodePosition(zpos : Float) -> SCNVector3{
        let xpos =  generateRandomCoordinate(max: 10)
        let ypos = generateRandomCoordinate(max: 2)
        let z = generateZPosDirection(zpos: zpos)
        return SCNVector3(x: xpos, y: ypos, z: z)
    }
}
