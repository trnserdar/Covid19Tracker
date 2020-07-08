//
//  DeathView.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 8.07.2020.
//

import SwiftUI

struct DeathView: View {
    
    var deathNumbers: NumbersModel
    
    var body: some View {
        
        HStack {
            VStack {
                Text("New Deaths")
                    .font(.headline)
                Text("\(self.deathNumbers.new ?? "")")
                    .font(.body)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            VStack {
                Text("Total Deaths")
                    .font(.headline)
                Text("\(self.deathNumbers.total ?? 0)")
                    .font(.body)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .padding()
        .foregroundColor(.white)
        .background(Color(hex: "204051"))
        .cornerRadius(16.0)
        .padding()
    }
}

struct DeathView_Previews: PreviewProvider {
    static var previews: some View {
        DeathView(deathNumbers: NumbersModel(new: "+16", active: nil, critical: nil, recovered: nil, the1MPop: nil, total: 5241))
    }
}
