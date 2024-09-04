//
//  LocationDeniedView.swift
//  MyWeather
//
//  Created by Szekely Janos on 24/05/2024.
//

import SwiftUI

struct LocationDeniedView: View {
    var body: some View {
        ContentUnavailableView(label: {
            Label("Location Services", systemImage: "gear")
        }, description: {
            Text("""
1. Tap on the button below to go to "Privacy and Security"
2. Tap on "Location Services"
3. Locate the "MyWeather" app and tap on it
4. Change the settings to "While Using the App"
""").multilineTextAlignment(.leading)
        }, actions: {
            Button(action: {}) {
                Button("Open Settings") {
                    UIApplication.shared.open(
                        URL(string: UIApplication.openSettingsURLString)!,
                        options: [:],
                        completionHandler: nil
                    )
                }.buttonStyle(.borderedProminent)
            }
        })
    }
}

#Preview {
    LocationDeniedView()
}
