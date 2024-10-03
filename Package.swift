// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Shwifttp",
    platforms: [
        .macOS(.v10_14), 
        .iOS(.v16), 
        .tvOS(.v16)
    ],
    products: [
        .library(
            name: "Shwifttp",
            targets: ["Shwifttp"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Shwifttp",
            dependencies: [],
            path: "Shwifttp"
        )
    ]
)
