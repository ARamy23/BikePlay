// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        productTypes: [
            "swift-composable-architecture": .framework,
        ]
    )
#endif

let package = Package(
    name: "BikePlay",
    dependencies: [
        // Add your own dependencies here:
         .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            from: "1.1.0"
         )
    ]
)
