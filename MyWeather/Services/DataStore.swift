//
//  DataStore.swift
//  MyWeather
//
//  Created by Szekely Janos on 05/06/2024.
//

import Foundation

@Observable
class DataStore {
    var forPreview: Bool
    var cities: [City] = []
    let fileManager = FileManager()
    
    init(forPreview: Bool = false) {
        self.forPreview = forPreview
        loadCities()
    }
    
    func loadCities() {
        if forPreview {
            cities = City.cities
        } else {
            if fileManager.fileExists() {
                do {
                    let data = try fileManager.readFile()
                    cities = try JSONDecoder().decode([City].self, from: data)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func saveCities() {
        if !forPreview {
            do {
                let data = try JSONEncoder().encode(cities)
                let jsonString = String(decoding: data, as: UTF8.self)
                try fileManager.saveFile(contents: jsonString)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
