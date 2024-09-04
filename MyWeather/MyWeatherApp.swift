//
//  MyWeatherApp.swift
//  MyWeather
//
//  Created by Szekely Janos on 20/05/2024.
//

import SwiftUI

@main
struct MyWeatherApp: App {
    @State private var locationManager = LocationManager()
    @State private var store = DataStore()
    var body: some Scene {
        WindowGroup {
            if locationManager.isAuthorized {
                ForecastView()
            } else {
                LocationDeniedView()
            }
        }
        .environment(locationManager)
        .environment(store)
    }
}
