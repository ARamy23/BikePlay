import ProjectDescription

let project = Project(
    name: "BikePlay",
    targets: [
        .target(
            name: "BikePlay",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.BikePlay",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["BikePlay/Sources/**"],
            resources: ["BikePlay/Resources/**"],
            dependencies: [
                .external(name: "ComposableArchitecture"),
            ]
        ),
        .target(
            name: "BikePlayTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.BikePlayTests",
            infoPlist: .default,
            sources: ["BikePlay/Tests/**"],
            resources: [],
            dependencies: [.target(name: "BikePlay")]
        ),
    ]
)
