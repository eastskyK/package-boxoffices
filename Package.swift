// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BoxOffices",
    platforms: [.iOS(.v15)], //최소 지원 platform
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "BoxOffices",
            targets: ["BoxOffices"]),
    ],
    dependencies: [
//        .package(url: <#T##String#>, from: <#T##Version#>)
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "BoxOffices"),
        .testTarget(
            name: "BoxOfficesTests",
            dependencies: ["BoxOffices"]),
    ]
)
