//
//  FileManager+Extension.swift
//  MyWeather
//
//  Created by Szekely Janos on 06/06/2024.
//

import Foundation

extension FileManager {
    static let fileName = "cities.json"
    static let sotageURL = URL.documentsDirectory.appendingPathComponent(fileName, conformingTo: .json)
    
    func fileExists() -> Bool {
        fileExists(atPath: Self.sotageURL.path())
    }
    
    func readFile() throws -> Data {
        do {
            return try Data(contentsOf: Self.sotageURL)
        } catch {
            throw error
        }
    }
    
    func saveFile(contents: String) throws {
        do {
            try contents.write(to: Self.sotageURL, atomically: true, encoding: .utf8)
        } catch {
            throw error
        }
    }
    
}
