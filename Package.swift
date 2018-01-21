// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GitHubUserRequest",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "GitHubUserRequest",
            targets: ["GitHubUserRequest"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
         .package(url: "https://github.com/davidthorn/GitHubUser.git" , from: "0.3.0"),
         .package(url: "https://github.com/davidthorn/DataRequest.git" , from: "1.0.0")
        
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "GitHubUserRequest",
            dependencies: [
                "DataRequest",
                "GitHubUser"
            ]),
        .target(
            name: "GitHubUserCLI",
            dependencies: [
                .target(name: "GitHubUserRequest"),
                "GitHubUser",
                "DataRequest"
            ]),
        .testTarget(
            name: "GitHubUserRequestTests",
            dependencies: ["GitHubUserRequest"]),
    ]
)
