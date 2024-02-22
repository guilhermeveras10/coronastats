//
//  SearchBarView.swift
//  CovidStats
//
//  Created by Guilherme Duarte on 21/02/24.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    var body: some View {
        HStack {
            TextField("Country....", text: $searchText)
                .foregroundColor(.white)
                .padding()
        }
        .frame(height: 50)
        .background(.regularMaterial)
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
