// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "feather-mail-driver-memory",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "FeatherMailDriverMemory", targets: ["FeatherMailDriverMemory"]),
    ],
    dependencies: [
        .package(url: "https://github.com/feather-framework/feather-mail.git", .upToNextMinor(from: "0.1.0")),
    ],
    targets: [
        .target(
            name: "FeatherMailDriverMemory",
            dependencies: [
                .product(name: "FeatherMail", package: "feather-mail"),
            ]
        ),
        .testTarget(
            name: "FeatherMailDriverMemoryTests",
            dependencies: [
                .product(name: "FeatherMail", package: "feather-mail"),
                .product(name: "XCTFeatherMail", package: "feather-mail"),
                .target(name: "FeatherMailDriverMemory"),
            ]
        ),
    ]
)
