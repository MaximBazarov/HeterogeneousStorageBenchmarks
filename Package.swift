// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//
//let package = Package(
//    name: "Kalimba",
//    products: [
//        .library(
//            name: "Kalimba",
//            targets: ["Kalimba"]),
//        .executable(name: "kalimba-benchmark", targets: ["kalimba-benchmark"]),
//    ],
//    dependencies: [
//        .package(url: "https://github.com/apple/swift-collections-benchmark", from: "0.0.1"),
//        .package(url: "https://github.com/apple/swift-collections", from: "0.0.1"),
//    ],
//    targets: [
//        .target(
//            name: "Kalimba",
//            dependencies: [
//                .product(name: "Collections", package: "swift-collections"),
//            ]),
//        .target(
//            name: "kalimba-benchmark",
//            dependencies: [
//                "Kalimba",
//                .product(name: "CollectionsBenchmark", package: "swift-collections-benchmark")
//            ]
//        ),
//    ]
//)

let package = Package(
    name: "StorageBenchmark",
    products: [
        .executable(name: "storage-benchmark", targets: ["StorageBenchmark"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-collections-benchmark", from: "0.0.1"),
    ],
    targets: [
        .executableTarget(
            name: "StorageBenchmark",
            dependencies: [
                .product(name: "CollectionsBenchmark", package: "swift-collections-benchmark")
            ]
        ),
    ]
)
