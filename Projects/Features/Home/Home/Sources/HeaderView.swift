//
//  HeaderView.swift
//  Home
//
//  Created by Ahmed Ramy on 14/06/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack(spacing: 12) {
            HStack(alignment: .center) {
                HStack(alignment: .lastTextBaseline) {
                    Text("Hello, Ramy")
                        .font(.title2)
                        .foregroundStyle(HomeAsset.Assets.black.swiftUIColor)

                    Text("Let's Ride!")
                        .font(.subheadline)
                        .foregroundStyle(HomeAsset.Assets.subheadline.swiftUIColor)

                    Spacer()
                }

                Circle()
                    .frame(width: 40)

                Circle()
                    .stroke(lineWidth: 4.0)
                    .frame(width: 40)
            }

            Divider().foregroundStyle(HomeAsset.Assets.subheadline.swiftUIColor)

            Spacer()
        }.padding()
    }
}

#Preview {
    HeaderView()
}
