# GitHubUserRequest


# Topics

* [Requirements](#requirements)

* [Installation](#installation)
  * [Carthage](#carthage)
  * [Swift Package Manager](#swift-pm)

* [Usage](#usage)

  
* [Dependencies](#dependencies)

* [References](#references)

<a name="requirements"><a/>

# Requirements

* Xcode 9.2
* Minimum iOS Deploment Target 9.0
* Swift 4.0

<a name="installation"></a>

# Installation

`GitHubUserRequest` doesn't contain any external dependencies.

These are currently the supported options:

# [Carthage](https://github.com/Carthage/Carthage)<a name="carthage"/>

**Tested with `carthage version`: `0.26.2`**

Add this to `Cartfile`

```
git "https://github.com/davidthorn/GitHubUserRequest.git"
```

```bash
$ carthage update
```

# [Swift Package Manager](https://github.com/apple/swift-package-manager) <a name="swift-pm"/>

**Tested with `swift build --version`: `Swift 4.0.0-dev (swiftpm-13126)`**

Create a `Package.swift` file.

```swift

// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "PACKAGE_NAME",
    dependencies: [
        .package(url: "https://github.com/davidthorn/GitHubUserRequest.git", from: "0.3.0")
    ],
    targets: [
        .target(name: "PACKAGE_NAME", dependencies: [
        "GitHubUserRequest"
        ])
    ]
    )

```

```bash
$ swift build
```
<a name="dependencies"></a>

# Dependencies 

<a name="usage"></a>

# Usage

<a name="references"></a>

## References

