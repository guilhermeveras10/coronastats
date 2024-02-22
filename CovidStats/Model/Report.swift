//
//  Report.swift
//  CovidStats
//
//  Created by Guilherme Duarte on 20/02/24.
//

import Foundation

struct AllReports: Codable {
    let data: [RegionReport]
}

struct RegionReport: Codable, Identifiable {
    let id = UUID()
    let date: Date
    let confirmed: Int
    let deaths: Int
    let active: Int
    let fatality_rate: Double
    let region: ReportDetail
    
    var formattedDate: String {
        date.formatted(date: .abbreviated, time: .omitted)
    }
    
    static let dummyData = RegionReport(date: Date.now, confirmed: 0, deaths: 0, active: 0, fatality_rate: 0.0, region: ReportDetail(name: "N/A", province: "province"))
}

struct ReportDetail: Codable {
    let name: String
    let province: String
}
