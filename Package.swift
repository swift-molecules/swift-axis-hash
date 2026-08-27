// swift-tools-version: 6.4
import PackageDescription

let package = Package(
    name: "swift-axis-hash",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Axis Hash",
            targets: ["Axis Hash"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-axis.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-hash.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Axis Hash",
            dependencies: [
                .product(name: "Axis", package: "swift-axis"),
                .product(name: "Hash", package: "swift-hash"),
            ]
        ),
        .testTarget(
            name: "Axis Hash Tests",
            dependencies: [
                "Axis Hash",
                .product(name: "Axis", package: "swift-axis"),
                .product(name: "Hash", package: "swift-hash"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
