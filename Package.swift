// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MjSocialLogins",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "MjSocialLogins",
            targets: ["MjSocialLogins"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/google/GoogleSignIn-iOS", .branch("main")),
        .package(url: "https://github.com/facebook/facebook-ios-sdk", .branch("main")),
    ],
    targets: [
        .target(
            name: "MjSocialLogins",
            dependencies: [
                .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS"),
                .product(name: "FacebookLogin", package: "facebook-ios-sdk"),
            ]),
        .testTarget(
            name: "MjSocialLoginsTests",
            dependencies: ["MjSocialLogins"]),
    ],
    swiftLanguageVersions: [.v5]
)
