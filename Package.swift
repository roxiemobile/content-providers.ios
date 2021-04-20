// swift-tools-version:5.3

import PackageDescription

// Swift Package Manager — Package
// @link https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html

let package = Package(
    name: "ContentProviders",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "ContentProviders",
            type: .static,
            targets: ["ContentProviders"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ContentProviders",
            dependencies: [
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
