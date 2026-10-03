
//  CargoShip.swift
//  Sheikh_Swift_4

//  Created by Sheikh Naim on 2026-05-14.

//  SpaceColonySupplyNetwork

//  ------------------------------------------------
//  Third child class inheriting from SupplyVehicle
//  Conforms to Scannable protocol
//  ------------------------------------------------

class CargoShip: SupplyVehicle, Scannable {
    
  // Unique stored property for this child class
  // fuelLevel (0-100) represents how much fuel remains
    
  var fuelLevel: Int  // percentage 0-100
  
  // Initializer, sets fuelLevel & calls parent init
    
  init(name: String, cargoCapacity: Int, fuelLevel: Int) {
      
    // Clamp fuelLevel between 0 and 100 (safe range)
      
    self.fuelLevel = min(max(fuelLevel, 0), 100)
    super.init(name: name, cargoCapacity: cargoCapacity)
  }
  
  // Overriding displayInfo to add cargo‑ship‑specific details
    
  override func displayInfo() {
    super.displayInfo()
    print("  Type: Heavy Cargo Ship (Fuel: \(fuelLevel)%)")
  }
  
  // ----------------------------------------------------------
  // Overrides loadCargo to demonstrate custom behavior
  // Shows method overriding, low fuel means less cargo for safety
  // ----------------------------------------------------------
    
  override func loadCargo(amount: Int) -> Int {
    if fuelLevel < 20 {
      print("  ⚠️ Low fuel! Only loading half capacity for safety.")
      
      // Only allows loading up to half of the ship's total capacity
      
      let halfCapacity = cargoCapacity / 2
      let spaceLeft = halfCapacity - currentCargo
      let toLoad = min(amount, spaceLeft)
      return super.loadCargo(amount: toLoad)
    }
    
      // Normal case: call parent's loadCargo
      
    return super.loadCargo(amount: amount)
  }

  // ----------------------------------------------------------
  // Implements Scannable protocol method
  // This gives cargo ships the ability to scan for landing zones
  // ----------------------------------------------------------
    
  func scanArea() {
    print("  🛰️ \(name) is using long-range sensors to scan for landing zones.")
  }
}
