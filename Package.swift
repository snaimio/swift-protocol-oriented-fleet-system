// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ColonyFleetManager",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(
            name: "ColonyFleetManager",
            targets: ["ColonyFleetManager"]
        )
    ],
    targets: [
        .executableTarget(
            name: "ColonyFleetManager",
            path: "Sources"
        )
    ]
)
