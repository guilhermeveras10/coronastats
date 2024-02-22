//
//  CountryDetailViewModel.swift
//  CovidStats
//
//  Created by Guilherme Duarte on 21/02/24.
//

import Foundation

// Uma classe final em Swift evita que a classe seja herdada.
final class CountryDetailViewModel: ObservableObject {
    
    @Published var reports: [RegionReport] = []
    @Published var alertItem: AlertItem?
    
    private var iso: String
    
    init(country: Country) {
        iso = country.iso
    }
    
    func fetchReport() {
        
        APIService.shared.fetchReport(for: iso) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let reports):
                    self.reports = reports
                case .failure(_):
                    self.alertItem = AlertContext.unableToFetchCountryStats
                }
            }
        }
    }
}
