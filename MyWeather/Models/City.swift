//
//  City.swift
//  MyWeather
//
//  Created by Szekely Janos on 24/05/2024.
//

import CoreLocation
import Foundation

struct City: Identifiable, Hashable, Codable {
    var id = UUID()
    var name: String
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var clLocation: CLLocation {
        CLLocation(latitude: latitude, longitude: longitude)
    }
    
    static var cities: [City] {
        [
            .init(name: "Paris, France", latitude: 48.856788, longitude: 2.351977),
            .init(name: "Sydney, Australia", latitude: -33.872710, longitude: 151.205694),
            .init(name: "Washington, DC", latitude: 38.895438, longitude: -77.031281)
        ]
    }
    
    static var mockCurrent: City {
        .init(name: "North Vancouver", latitude: 49.320991, longitude: -123.074718)
    }
}
