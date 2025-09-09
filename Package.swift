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
            targets: ["PointPubTarget"])
    ],
    dependencies: [
    ],
    targets: [
	.binaryTarget(
            name: "PointPubSDK",
            url: "https://github.com/adxcorp/pointpub-ios-release/releases/download/0.0.1/PointPubSDK.xcframework.zip",
            checksum: "15145e9c2b0e18cf28289de7f01da4a5cd47830ab7b43a8dddb65d09f3215720"
        ),
	.target(
            name: "PointPubTarget",
            dependencies: [
                .target(name: "PointPubSDK"),
            ],
            path: "Framework/Dependency",
            exclude: ["../../Sample"]
        ),
    ]
)
