//
//  TotalDataView.swift
//  CovidStats
//
//  Created by Guilherme Duarte on 21/02/24.
//

import SwiftUI

struct TotalDataView: View {
    
    var totalData: TotalData
    
    var body: some View {
        VStack {
            HStack {
                DataCardView(number: totalData.confirmed.formatNumber, name: "Confirmed")
                DataCardView(number: totalData.active.formatNumber, name: "Active", color: .green)
            }
            HStack {
                DataCardView(number: totalData.deaths.formatNumber, name: "Deaths", color: .red)
                DataCardView(number: String(format: "%.2f", totalData.fatality_rate), name: "Death: %", color: .red)
            }
        }
        .frame(height: 170)
        .padding(10)
    }
}

#Preview {
    TotalDataView(totalData: TotalData.dummyData)
}
