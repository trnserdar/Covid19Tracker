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
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(Color(hex: "00bcd4"))

            Text("New Deaths")
                .font(.headline)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                .foregroundColor(Color(hex: "ff5722"))

            Text("Total Deaths")
                .font(.headline)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                .foregroundColor(Color(hex: "dd2c00"))
        }
    }
}

struct StatisticHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticHeaderView()
    }
}
