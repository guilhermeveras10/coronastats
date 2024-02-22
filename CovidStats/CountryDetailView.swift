//
//  CountryDetailView.swift
//  CovidStats
//
//  Created by Guilherme Duarte on 21/02/24.
//

import SwiftUI

struct CountryDetailView: View {
    
    @ObservedObject var viewModel: CountryDetailViewModel
    
    var body: some View {
        
        VStack {
            if viewModel.reports.count > 1 {
                List {
                    ForEach(viewModel.reports) { report in
                        
                        NavigationLink(destination: ReportView(report: report)) {
                            Text(report.region.province)
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle(viewModel.reports.first?.region.name ?? "Unknown country")
                .navigationBarTitleDisplayMode(.inline)
            } else {
                ReportView(report: viewModel.reports.first ?? RegionReport.dummyData)
                    .ignoresSafeArea()
            }
        }
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
        .onAppear {
            if viewModel.reports.count == 0 {
                viewModel.fetchReport()
            }
        }
    }
}

#Preview {
    CountryDetailView(viewModel: CountryDetailViewModel(country: Country.dummyData))
}
