// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "native_crash",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(name: "native-crash", targets: ["native_crash"])
    ],
    dependencies: [
        .package(url: "https://github.com/securing/IOSSecuritySuite.git", from: "1.5.0")
    ],
    targets: [
        .target(
            name: "native_crash",
            dependencies: [
                .product(name: "IOSSecuritySuite", package: "IOSSecuritySuite")
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy"),
            ]
        )
    ]
)
