//
//  CountryDetailView.swift
//  CovidStats
//
//  Created by Guilherme Duarte on 21/02/24.
//

import SwiftUI

struct CountryDetailView: View {
    
    // É um protocolo requerido para quando vamos usar @StateObject e outras propriedades de "compartilhamento". É o programador dizendo que aquela classe (só funciona em classes) e seus valores podem ser vistos por outras partes do código.
    
    // Certo, até agora só observamos, pegamos o valor da classe. Mas e se quisermos alterar esse valor?
    
    /// class DataModel: ObservableObject {
    ///     @Published var name = "Some Name"
    ///     @Published var isEnabled = false
    /// }

    /// struct MyView: View {
    ///     @StateObject var model = DataModel()
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text(model.name)
    ///             Toggle("Enabled", isOn: $model.isEnabled)
    ///                 .onChange(of: model.isEnabled) { isEnabled in
    ///                     print ("O toggle está \(isEnabled)")
    ///                 }
    ///         }
    ///     }
    /// }
    
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
        // Testando esse código, você pode checar o console quando estiver clicando no toggle e verá que a mudança na propridade isEnabled está sendo alterada e comunicada pra todas as views.
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
