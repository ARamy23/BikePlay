import ProjectDescription

let project = Project(
    name: "Home",
    targets: [
        .target(
            name: "Home",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Home",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["Home/Sources/**"],
            resources: ["Home/Resources/**"],
            dependencies: [
                .external(name: "ComposableArchitecture"),
                .xcframework(path: "../../../Packages/Mapbox/MapboxCommon.xcframework", status: .required),
                .xcframework(path: "../../../Packages/Mapbox/MapboxCoreMaps.xcframework", status: .required),
                .xcframework(path: "../../../Packages/Mapbox/MapboxMaps.xcframework", status: .required),
                .xcframework(path: "../../../Packages/Mapbox/Turf.xcframework", status: .required)
            ]
        ),
        .target(
            name: "HomeTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.HomeTests",
            infoPlist: .default,
            sources: ["Home/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Home")]
        ),
    ]
)
