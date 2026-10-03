
//  SupplyVehicle.swift
//  Sheikh_Swift_4

//  Created by Sheikh Naim on 2026-05-14.

//  SpaceColonySupplyNetwork
 
//  ----------------------------------------------------------
//  Parent class, holds common info for all supply vehicles.
//  Every vehicle in the colony shares some basic properties.
//  ----------------------------------------------------------

class SupplyVehicle {
  
  // stored properties, every vehicle has a name, max capacity, and current load
  
  let name: String
  let cargoCapacity: Int
  var currentCargo: Int

  // initializer, sets the name and capacity, cargo starts at 0
    
  init(name: String, cargoCapacity: Int) {
    self.name = name
    self.cargoCapacity = cargoCapacity
    self.currentCargo = 0
  }
  
  // shows the vehicle's name, capacity, and current load
    
  func displayInfo() {
    print("Vehicle Name: \(name)")
    print("  Capacity: \(cargoCapacity) kg")
    print("  Current Load: \(currentCargo) kg")
  }
  
  // adds cargo up to the limit, returns how much was actually loaded
  
  func loadCargo(amount: Int) -> Int {
    let spaceLeft = cargoCapacity - currentCargo
    let toLoad = min(amount, spaceLeft) //  can't exceed remaining space
    currentCargo += toLoad
    print("  Loaded \(toLoad) kg onto \(name).")
    return toLoad
  }
}
