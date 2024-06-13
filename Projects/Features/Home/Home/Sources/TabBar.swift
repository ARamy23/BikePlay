import Foundation
import SwiftUI

struct TabBar: View {
    @State var tab: Tab = .home

    init() { UITabBar.appearance().isHidden = true }

    var body: some View {
        ZStack(alignment: .init(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $tab) {
                ForEach(Tab.allCases) { tab in
                    tab.view
                        .tag(tab)
                        .tabItem {
                            Image(systemName: tab.symbol)
                        }
                }
            }
            HStack(spacing: 0) {
                TabBarButton(selectedTab: $tab, tab: .calendar)
                Spacer(minLength: 0)
                TabBarButton(selectedTab: $tab, tab: .home)
                Spacer(minLength: 0)
                TabBarButton(selectedTab: $tab, tab: .insights)
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(HomeAsset.Assets.black.swiftUIColor)
            .clipShape(Capsule())
            .padding(.horizontal, 25)
        }
    }
}

enum Tab: String, CaseIterable, Identifiable {
    var id: String { rawValue }

    case calendar = "Calendar"
    case home = "Home"
    case insights = "Insights"

    @ViewBuilder
    var view: some View {
        switch self {
        case .home:
            HomeView()
        default:
            Text(rawValue)
        }
    }

    var symbol: String {
        switch self {
        case .calendar:
            "calendar"
        case .home:
            "house"
        case .insights:
            "scale.3d"
        }
    }
}

#Preview {
    TabBar()
}
