
//  Drone.swift
//  Sheikh_Swift_4

//  Created by Sheikh Naim on 2026-05-14.

//  SpaceColonySupplyNetwork

//  ----------------------------------------------------
//  Second child class inheriting from SupplyVehicle
//  Conforms to both Repairable and Scannable protocols
//  ----------------------------------------------------

class Drone: SupplyVehicle, Repairable, Scannable {
  
  // Unique stored property for this child class
  // maxAltitude (in meters) represents how high the drone can fly
    
  var maxAltitude: Int
  
  // Initializer, sets maxAltitude & calls parent init
    
  init(name: String, cargoCapacity: Int, maxAltitude: Int) {
    self.maxAltitude = maxAltitude
    super.init(name: name, cargoCapacity: cargoCapacity)
  }
  
  // Overriding displayInfo to add drone‑specific details
  
  override func displayInfo() {
    super.displayInfo()
    print("  Type: Aerial Drone (Max Alt: \(maxAltitude) m)")
  }

  // Implementing Repairable protocol method
  // Drones can be repaired if they crash or break down
    
  func repair() {
    print("  🛸 Calibrating the propellers on \(name).")
  }

  // Implementing Scannable protocol method
  // Drones can scan the area from above
    
  func scanArea() {
    print("  📡 \(name) is scanning the planet surface from \(maxAltitude) meters up.")
  }
}
