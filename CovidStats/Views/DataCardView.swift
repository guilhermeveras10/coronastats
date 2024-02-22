//
//  DataCardView.swift
//  CovidStats
//
//  Created by Guilherme Duarte on 21/02/24.
//

import SwiftUI

struct DataCardView: View {
    
    var number: String = "--"
    var name: String = "Error"
    var color: Color = .primary
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                Text(self.number)
                    .font(.subheadline)
                    .foregroundColor(self.color)
                
                Text(self.name)
                    .font(.body)
                    .foregroundColor(self.color)
            }
            .frame(width: geometry.size.width, height: 80, alignment: .center)
            .background(Color("cardBackground"))
            .cornerRadius(8.0)
        }
    }
}

#Preview {
    DataCardView()
}
