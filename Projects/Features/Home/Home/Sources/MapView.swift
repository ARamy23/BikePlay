import SwiftUI
@_spi(Experimental) import MapboxMaps

@available(iOS 14.0, *)
struct MapView: View {
    var body: some View {
        let polygon = Polygon(center: .init(latitude: 0, longitude: 0), radius: 10000, vertices: 30)
        Map(initialViewport: .overview(geometry: polygon))
            .mapStyle(.standard(lightPreset: .day))
    }
}

#Preview {
    MapView()
}
