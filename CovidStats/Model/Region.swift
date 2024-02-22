//
//  Region.swift
//  CovidStats
//
//  Created by Guilherme Duarte on 20/02/24.
//

import Foundation

struct AllRegions: Codable {
    let data: [Country]
}

struct Country: Codable {
    let iso: String
    let name: String
    
    static let dummyData = Country(iso: "N/A", name: "Error")
}
