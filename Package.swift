// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "PointPubSDK",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "PointPubSDK",
            targets: ["pointpub-target"])
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "pointpub-binary-target",
            path: "PointPub/PointPubSDK.xcframework"
        ),
	.target(
            name: "pointpub-target",
            dependencies: [
                .target(name: "pointpub-binary-target"),
            ],
            path: "PointPub/Dependency",
            exclude: [
                "../../pointpub-sample-swift",
                "../../pointpub-sample-objc"
            ]
        ),
    ]
)
