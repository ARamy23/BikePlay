import SwiftUI

public struct HomeView: View {
    public init() {}

    public var body: some View {
        ZStack {
            HomeAsset.Assets.background.swiftUIColor.ignoresSafeArea()
            HeaderView()

            
        }
    }
}

#Preview {
    HomeView()
}
