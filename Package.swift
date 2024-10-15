// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftGodotKit",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .library(name: "SwiftGodotKit", targets: ["SwiftGodotKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/migueldeicaza/SwiftGodot", branch: "main")
    ],
    targets: [
        .target(
            name: "SwiftGodotKit",
            dependencies: [
                "SwiftGodot",
                .target(name: "binary_libgodot", condition: .when(platforms: [.macOS])),
                .target(name: "libgodot", condition: .when(platforms: [.linux, .windows]))
            ]
        ),

        .binaryTarget (
            name: "binary_libgodot",
            url: "https://github.com/migueldeicaza/SwiftGodotKit/releases/download/4.3.5/libgodot.xcframework.zip",
            checksum: "865ea17ad3e20caab05b3beda35061f57143c4acf0e4ad2684ddafdcc6c4f199"
        ),
        
        .systemLibrary(name: "libgodot")
    ]
)
