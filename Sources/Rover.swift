
//  Rover.swift
//  Sheikh_Swift_4

//  Created by Sheikh Naim on 2026-05-14.

//  SpaceColonySupplyNetwork

//  ----------------------------------------------------
//  First child class inheriting from SupplyVehicle
//  Conforms to Repairable protocol
//  ----------------------------------------------------

class Rover: SupplyVehicle, Repairable {
    
  // Unique stored property for this child class
  // wheelCount, how many wheels the rover has
    
  var wheelCount: Int

  init(name: String, cargoCapacity: Int, wheelCount: Int) {
    self.wheelCount = wheelCount
    super.init(name: name, cargoCapacity: cargoCapacity)
  }

  // Overriding displayInfo to add rover‑specific details
    
  override func displayInfo() {
    super.displayInfo()
    print("  Type: Ground Rover with \(wheelCount) wheels.")
  }
  
  // Overrides loadCargo to show custom behavior
  // Rovers bounce a lot, so some supplies fall out 😅

  override func loadCargo(amount: Int) -> Int {
    print("  Rover bumping over rocks... some supplies fall out.")
    let loaded = super.loadCargo(amount: amount)
    if loaded > 0 {
      print("  Actually only \(loaded) kg made it inside.")
    }
    return loaded
  }
  
  // Implementing Repairable protocol method

  func repair() {
    print("  🔧 Fixing the suspension and checking the \(wheelCount) wheels on \(name)... Done!")
  }
}
