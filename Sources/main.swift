
//  main.swift (main program)
//  Sheikh_Swift_4

//  Created by Sheikh Naim on 2026-05-14.

//  SpaceColonySupplyNetwork

import Foundation

//  --------------------------------------------------------------------------
//  Main program
//  Stores all the vehicles in an array [SupplyVehicle]
//  This array holds any SupplyVehicle, its children (Rover, Drone, CargoShip)
//  Demonstrates polymorphism
//  --------------------------------------------------------------------------

var fleet: [SupplyVehicle] = []
var shouldExit = false

//  Helper functions for safe user input (readLine with Int/String)

func readInt(prompt: String) -> Int {
  print(prompt, terminator: "")
  guard let input = readLine(), let value = Int(input) else {
    print("  Invalid input. Using 0.")
    return 0
  }
  return value
}

func readString(prompt: String) -> String {
  print(prompt, terminator: "")
  return readLine() ?? ""
}

//  --------------------------------------------------------------
//  Creates different vehicle types (Rover, Drone, CargoShip)
//  Each creation function prompts the user for unique properties,
//  then appends the new vehicle to the fleet array.
//  --------------------------------------------------------------

func createRover() {
  let name = readString(prompt: "Rover name: ")
  let capacity = readInt(prompt: "Cargo capacity (kg): ")
  let wheels = readInt(prompt: "Number of wheels: ")
  let rover = Rover(name: name, cargoCapacity: capacity, wheelCount: wheels)
  fleet.append(rover)
  print("✅ Rover '\(name)' added.")
}

func createDrone() {
  let name = readString(prompt: "Drone name: ")
  let capacity = readInt(prompt: "Cargo capacity (kg): ")
  let alt = readInt(prompt: "Max altitude (meters): ")
  let drone = Drone(name: name, cargoCapacity: capacity, maxAltitude: alt)
  fleet.append(drone)
  print("✅ Drone '\(name)' added.")
}

func createCargoShip() {
  let name = readString(prompt: "Ship name: ")
  let capacity = readInt(prompt: "Cargo capacity (kg): ")
  let fuel = readInt(prompt: "Fuel level (0-100): ")
  let ship = CargoShip(name: name, cargoCapacity: capacity, fuelLevel: fuel)
  fleet.append(ship)
  print("✅ Cargo Ship '\(name)' added.")
}

//  ---------------------------------------------------------------
//  Displays all the vehicle details (using overridden displayInfo)
//  ---------------------------------------------------------------

func viewAllVehicles() {
  print("\n--- Current Colony Fleet ---")
  if fleet.isEmpty {
    print("No vehicles registered yet.")
    return
  }
  for (i, vehicle) in fleet.enumerated() {
    print("\n[\(i + 1)]")
    vehicle.displayInfo()   //  Calls the overridden version in each child class
  }
}

//  -----------------------------------------------------------
//  Loads cargo onto a specific vehicle
//  Demonstrates the loadCargo method (which may be overridden)
//  -----------------------------------------------------------

func loadCargoForVehicle() {
  guard !fleet.isEmpty else {
    print("\nNo vehicles to load.")
    return
  }
  print("\nSelect vehicle by number:")
  for (i, vehicle) in fleet.enumerated() {
    print("  \(i + 1)) \(vehicle.name)")
  }
  let idx = readInt(prompt: "Choice: ") - 1
  guard idx >= 0 && idx < fleet.count else {
    print("Invalid selection.")
    return
  }
  let vehicle = fleet[idx]
  let amount = readInt(prompt: "Amount to load (kg): ")
  _ = vehicle.loadCargo(amount: amount) //  Overridden method called via polymorphism
}

//  --------------------------------------------------------
//  Run Vehicle Actions demonstrates:
//      - Method overriding (loadCargo test)
//      - Protocol conformance (as? Repairable, as? Scannable)
//      - Polymorphism (iterating array of base class)
//  --------------------------------------------------------

func runVehicleActions() {
  print("\n--- Running Behaviours ---") // (Polymorphism & Protocols)
  if fleet.isEmpty {
    print("No vehicles to act upon.")
    return
  }
  for vehicle in fleet {
    print("\n👉 \(vehicle.name)")
    vehicle.displayInfo()   // Overridden displayInfo
    
    // Demonstrates overridden loadCargo by loading a small test amount
      
    print("  [Test loading 15 kg...]")
    _ = vehicle.loadCargo(amount: 15)   // Calls child's override if available
    
    //  ---------------------------------------------------------------------
    //  Demonstrates protocol conformance using type casting
    //  At least one class conforms to Repairable, at least one to Scannable,
    //  and at least one conforms to both. checking each vehicle dynamically.
    //  ---------------------------------------------------------------------
      
    if let repairable = vehicle as? Repairable {
      repairable.repair()   // Calls the repair() method from Repairable protocol
    } else {
      print("  (Not repairable)")
    }
    
    if let scannable = vehicle as? Scannable {
      scannable.scanArea()  // Calls the scanArea() method from Scannable protocol
    } else {
      print("  (Not scannable)")
    }
  }
}

//  ---------- Main Menu ----------

print("\n--- Welcome to the Space Colony Supply Network ---")

while !shouldExit {
  print("\nMenu Options:")
  print("=============================")
  print("1) Create Rover")
  print("2) Create Drone")
  print("3) Create Cargo Ship")
  print("4) View All Vehicles")
  print("5) Load Cargo onto a Vehicle")
  print("6) Run Vehicle Actions") // (Override/Protocols)
  print("7) Exit")
  print("\nPlease select an option: ", terminator: "")
  
  if let choice = readLine() {
    switch choice {
    case "1":
      createRover()
    case "2":
      createDrone()
    case "3":
      createCargoShip()
    case "4":
      viewAllVehicles()
    case "5":
      loadCargoForVehicle()
    case "6":
      runVehicleActions()
    case "7":
      print("Exiting system. Safe travels, Commander!")
      shouldExit = true
    default:
      print("Invalid option, please try again.")
    }
  }
}
