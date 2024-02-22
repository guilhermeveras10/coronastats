//
//  MainViewModel.swift
//  CovidStats
//
//  Created by Guilherme Duarte on 20/02/24.
//

import Foundation

// Uma classe final em Swift evita que a classe seja herdada.
final class MainViewModel: ObservableObject {
    
    // Esse wrapper adiciona a propriedade de recarregar as views que usam a variável marcada como @Published. É como se ela gritasse para todas as views que usam essa variável: "Eu fui mudada!".
    @Published var totalData = TotalData.dummyData
    // Esse wrapper adiciona a propriedade de recarregar as views que usam a variável marcada como @Published. É como se ela gritasse para todas as views que usam essa variável: "Eu fui mudada!".
    @Published var allCountries: [Country] = []
    // Esse wrapper adiciona a propriedade de recarregar as views que usam a variável marcada como @Published. É como se ela gritasse para todas as views que usam essa variável: "Eu fui mudada!".
    @Published var searchText = ""
    // Esse wrapper adiciona a propriedade de recarregar as views que usam a variável marcada como @Published. É como se ela gritasse para todas as views que usam essa variável: "Eu fui mudada!".
    @Published var isSearchVisible = false
    // Esse wrapper adiciona a propriedade de recarregar as views que usam a variável marcada como @Published. É como se ela gritasse para todas as views que usam essa variável: "Eu fui mudada!".
    @Published var alertItem: AlertItem?
    
    init() {
        fetchTotalData()
        fetchAllCountries()
    }
    
    func fetchTotalData() {
        APIService.shared.fetchTotalData { result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let totalData):
                    self.totalData = totalData
                case .failure(_):
                    self.alertItem = AlertContext.unableToFetchTotalStats
                }
            }
        }
    }
    
    func fetchAllCountries() {
        APIService.shared.fetchAllRegions { result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let allCountries):
                    self.allCountries = allCountries.sorted(by: { $0.name < $1.name })
                case .failure(_):
                    self.alertItem = AlertContext.unableToFetchCountries
                }
            }
        }
    }
}
