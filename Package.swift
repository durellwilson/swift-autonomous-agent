// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SwiftAutonomousAgent",
    platforms: [.macOS(.v15)],
    products: [
        .executable(name: "agent", targets: ["SwiftAutonomousAgent"]),
    ],
    targets: [
        .executableTarget(name: "SwiftAutonomousAgent"),
        .testTarget(name: "SwiftAutonomousAgentTests", dependencies: ["SwiftAutonomousAgent"]),
    ]
)
