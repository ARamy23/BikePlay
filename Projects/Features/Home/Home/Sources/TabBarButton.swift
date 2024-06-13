import SwiftUI

struct TabBarButton: View {
    @Binding var selectedTab: Tab
    var tab: Tab = .home

    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selectedTab = tab
            }
        }) {
            Image(systemName: tab.symbol)
            .frame(width: 25, height: 25)
            .foregroundStyle(HomeAsset.Assets.background.swiftUIColor)
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(
                Circle()
                    .foregroundStyle(
                        HomeAsset
                            .Assets
                            .background
                            .swiftUIColor
                            .opacity(
                                selectedTab == tab
                                ? 0.16
                                : 0
                            )
                    )
            )
        }
    }
}

#Preview {
    TabBarButton(
        selectedTab: .constant(
            .home
        )
    )
}
