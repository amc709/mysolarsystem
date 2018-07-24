//
//  ViewController.swift
//  MySolarSystem
//
//  Created by Joseph Anthony Castillon on 7/11/18.
//  Copyright © 2018 Joseph Anthony Castillon. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    let imagePicker = UIImagePickerController()
    
    let planetsMap : [String : Planet] = [
        "Sun" : Planet(name: "Sun", radius: 1.0, textureFile: "art.scnassets/2k_sun.jpg", zpos:  0.5)
        , "Moon" : Planet(name: "Moon" , radius: 0.08, textureFile: "art.scnassets/2k_moon.jpg", zpos:  2.75)
        , "Mercury" : Planet(name:  "Mercury", radius: 0.1, textureFile: "art.scnassets/2k_mercury.jpg", zpos:  1.5)
        , "Venus" : Planet(name: "Venus", radius: 0.1, textureFile: "art.scnassets/2k_venus_surface.jpg", zpos:  2.0)
        , "Earth" : Planet(name: "Earth" , radius: 0.1, textureFile: "art.scnassets/Earth_TEXTURE_CM.tga", zpos:  3.0)
        , "Mars" : Planet(name: "Mars" , radius: 0.1, textureFile: "art.scnassets/2k_mars.jpg", zpos:  -3.5)
        , "Jupiter" : Planet(name: "Jupiter" , radius: 0.3, textureFile: "art.scnassets/2k_jupiter.jpg", zpos:  4.0)
        , "Saturn" : Planet(name: "Saturn" , radius: 0.3, textureFile: "art.scnassets/2k_saturn.jpg", zpos:  5.0)
        , "Uranus" : Planet(name: "Uranus" , radius: 0.25, textureFile: "art.scnassets/2k_uranus.jpg", zpos:  6.0)
        , "Neptune" : Planet(name: "Neptune" , radius: 0.25, textureFile: "art.scnassets/2k_neptune.jpg", zpos:  6.5)
        
        ,"Earth_Day" : Planet(name: "Earth" , radius: 0.1, textureFile: "art.scnassets/2k_earth_daymap.jpg", zpos:  3.0)
        ,"Earth_Night" : Planet(name: "Earth" , radius: 0.1, textureFile: "art.scnassets/2k_earth_nightmap.jpg", zpos:  3.0)
        
    ]
    
    var planetsToView : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        guard let navBar = navigationController?.navigationBar else {
            fatalError("NavigationController does not exist")
        }
//        navBar.isTranslucent = false
        
        buildARPlanets()
        
        sceneView.autoenablesDefaultLighting = true;
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        print("Camera tapped")
    }
    
    func buildARPlanets(){
        
        let planetBuilder = PlanetBuilder()
        for planet in planetsToView! {
            if let planetToBuild = planetsMap[planet]{
                
                print("Building planet:  \(planetToBuild.name) ... zpos:  \(planetToBuild.zpos)")
                
                planetBuilder.buildPlanet(sceneView: sceneView, planet: planetToBuild, zpos: planetToBuild.zpos)
            }
        }
    }
    
    

}
