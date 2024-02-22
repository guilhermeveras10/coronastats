//
//  ReportView.swift
//  CovidStats
//
//  Created by Guilherme Duarte on 21/02/24.
//

import SwiftUI

struct ReportView: View {
    
    var report: RegionReport
    
    var body: some View {

        ZStack(alignment: .top) {
            
            LinearGradient(colors: [
                Color(red: 0.76, green: 0.15, blue: 0.26),
                Color(red: 0.01, green: 0.23, blue: 0.5)
            ], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Text(report.region.name)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                
                Text(report.region.province)
                    .foregroundColor(.white)
                    .font(.title)
                
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Date: \(report.formattedDate)")
                    Text("Confirmed: \(report.confirmed.roundedWithAbbreviations)")
                    Text("Active cases: \(report.active.roundedWithAbbreviations)")
                    Text("Deaths: \(report.deaths.roundedWithAbbreviations)")
                    Text("Fatality Rate: \(report.fatality_rate.formatted())%")
                }
                .font(.title2)
                .frame(maxWidth: .infinity)
                .padding(50)
                .background(.ultraThickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                
                Spacer()
                Spacer()

            }

        }

    }
}

#Preview {
    ReportView(report: RegionReport.dummyData)
}
