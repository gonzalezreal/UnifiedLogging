// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UnifiedLogHandler",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10),
        .tvOS(.v10),
        .watchOS(.v3),
    ],
    products: [
        .library(name: "UnifiedLogHandler", targets: ["UnifiedLogHandler"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log", from: "1.2.0"),
    ],
    targets: [
        .target(name: "UnifiedLogHandler", dependencies: ["Logging"]),
        .testTarget(name: "UnifiedLogHandlerTests", dependencies: ["UnifiedLogHandler"]),
    ]
)
