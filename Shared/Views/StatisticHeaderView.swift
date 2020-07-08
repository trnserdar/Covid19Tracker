//
//  StatisticHeaderView.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 8.07.2020.
//

import SwiftUI

struct StatisticHeaderView: View {
    
    var body: some View {
        HStack {
            Text("Country")
                .font(.headline)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color(hex: "84a9ac"))
                .cornerRadius(8.0)
            
            Text("New Deaths")
                .font(.headline)
                .padding()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                .background(Color(hex: "3b6978"))
                .cornerRadius(8.0)

            Text("Total Deaths")
                .font(.headline)
                .padding()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                .background(Color(hex: "204051"))
                .cornerRadius(8.0)
        }
        .foregroundColor(.white)
    }
}

struct StatisticHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticHeaderView()
    }
}
