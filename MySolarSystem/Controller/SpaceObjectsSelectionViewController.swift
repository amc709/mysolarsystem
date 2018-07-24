//
//  SpaceObjectsSelectionViewController.swift
//  MySolarSystem
//
//  Created by Joseph Anthony Castillon on 7/14/18.
//  Copyright © 2018 Joseph Anthony Castillon. All rights reserved.
//

import UIKit
import ChameleonFramework

class SpaceObjectsSelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var planetsTableView: UITableView!
    
    @IBOutlet weak var viewButton: UIButton!
    
    let spaceObjects : [PlanetSelection] = [
        PlanetSelection(planetName: "Sun", iconFile: "sun_icon.png")
        , PlanetSelection(planetName: "Moon", iconFile: "moon_icon.png")
        , PlanetSelection(planetName: "Mercury", iconFile: "mercury_icon.png")
        , PlanetSelection(planetName: "Venus",iconFile: "venus_icon.png")
        , PlanetSelection(planetName: "Earth", iconFile: "earth_icon.png")
        , PlanetSelection(planetName: "Mars", iconFile: "mars_icon.png")
        , PlanetSelection(planetName: "Jupiter", iconFile: "jupiter_icon.png")
        , PlanetSelection(planetName: "Saturn", iconFile: "saturn_icon.png")
        , PlanetSelection(planetName: "Uranus", iconFile: "uranus_icon.png")
        , PlanetSelection(planetName: "Neptune", iconFile: "neptune_icon.png")
    ]
    var selectedPlanets : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        planetsTableView.delegate = self
        planetsTableView.dataSource = self
        
        //TODO: Register your MessageCell.xib file here:
        planetsTableView.register(UINib(nibName: "CustomPlanetSelectionViewCell", bundle: nil), forCellReuseIdentifier: "customPlanetSelectorCell")
        
        planetsTableView.backgroundColor = UIColor(patternImage: UIImage(named: "PlanetQuest_background.png")!)
        
        configureTableView()
        
        planetsTableView.separatorStyle = .none
        
        guard let navBar = navigationController?.navigationBar else {
            fatalError("NavigationController does not exist")
        }
        
        
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customPlanetSelectorCell", for: indexPath) as! CustomPlanetSelectionViewCell
        
        print("row \(indexPath.row): \(indexPath.row % 2 == 0)")
        cell.backgroundColor =
            (indexPath.row % 2 == 0)
            ? UIColor(hexString: "E9FDCD")
            : UIColor(hexString: "A9FEFF")

        let obj = spaceObjects[indexPath.row]
        
        cell.planetLabel.text = obj.planetName
        cell.planetImage.image = obj.iconFile != ""
            ? UIImage(named: obj.iconFile)
            : nil
        cell.accessoryType = obj.selected ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spaceObjects.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj = spaceObjects[indexPath.row]
        obj.selected = !obj.selected
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // This sets the custom message cell to automatically expand in
    // height to fit the message body.
    func configureTableView(){
        planetsTableView.rowHeight = UITableViewAutomaticDimension
        planetsTableView.estimatedRowHeight = 120.0
    }
    
    @IBAction func viewBtnPressed(_ sender: UIButton) {
        print("View button pressed")
        self.selectedPlanets = []
        for obj in spaceObjects{
            if obj.selected {
                
                if obj.planetName == "Earth"{
                    let rnd = Int(arc4random_uniform(100))
                    var earthName = "Earth"
                    if rnd > 75 {
                        earthName = "Earth Night"
                    } else if rnd > 50 {
                        earthName = "Earth_Day"
                    }
                    
                    selectedPlanets.append(earthName)
                } else {
                    selectedPlanets.append(obj.planetName)
                }
            }
        }
        
        if selectedPlanets.count == 0 {
            let alertCtrl = UIAlertController(title: "No planets selected", message: "Please select planets to view.", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertCtrl.addAction(alertAction)
            present(alertCtrl, animated: true, completion: nil)
        } else {
            print("selected planets:  \(selectedPlanets)")
            
            performSegue(withIdentifier: "viewPlanetsAR", sender: self)
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let arView = segue.destination as! ViewController
        if self.selectedPlanets.count > 0 {
            arView.planetsToView = selectedPlanets
        }
    }


}
