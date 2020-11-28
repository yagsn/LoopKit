// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoopKit",
    defaultLocalization: "en",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "LoopKit", type: .dynamic, targets: ["LoopKit"]),
        .library(name: "LoopKitUI", type: .dynamic, targets: ["LoopKitUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ps2/SwiftCharts.git", .branch("uikit-explicit"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "LoopKit",
            dependencies: [],
            path: "LoopKit",
            exclude: ["Info.plist"]
        ),
        .target(
            name: "LoopKitUI",
            dependencies: ["LoopKit", "SwiftCharts"],
            path: "LoopKitUI",
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "LoopKitTests",
            dependencies: ["LoopKit"],
            path: "LoopKitTests",
            exclude: ["Fixtures", "Info.plist"]
        ),
    ]
)
