// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "PromptHub",
    platforms: [
        .macOS(.v15)
    ],
    targets: [
        .executableTarget(
            name: "PromptHub",
            path: "Sources"
        )
    ]
)
