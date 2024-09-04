//
//  AttributionView.swift
//  MyWeather
//
//  Created by Szekely Janos on 20/05/2024.
//

import SwiftUI
import WeatherKit

struct AttributionView: View {
    @Environment(\.colorScheme) private var colorScheme
    let weatherManager = WeatherManager.shared
    @State private var attributon: WeatherAttribution?
    
    var body: some View {
        VStack {
            if let attributon {
                AsyncImage(
                    url: colorScheme == .dark ? attributon.combinedMarkDarkURL : attributon.combinedMarkLightURL) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                    } placeholder: {
                        ProgressView()
                    }
                Text(.init("[\(attributon.serviceName)](\(attributon.legalPageURL))"))
            }
        }
        .task {
            Task.detached { @MainActor in
                attributon = await weatherManager.weatherAttribution()
            }
        }
    }
}

#Preview {
    AttributionView()
}
