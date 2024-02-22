//
//  TotalData.swift
//  CovidStats
//
//  Created by Guilherme Duarte on 20/02/24.
//

import Foundation

struct TotalDataObject: Codable {
    let data: TotalData
}

struct TotalData: Codable {
    let confirmed: Int
    let deaths: Int
    let active: Int
    let fatality_rate: Double
    
    static let dummyData = TotalData(confirmed: 0, deaths: 0, active: 0, fatality_rate: 0.0)
}


