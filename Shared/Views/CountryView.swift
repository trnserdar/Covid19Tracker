//
//  CountryView.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 8.07.2020.
//

import SwiftUI

struct CountryView: View {
    
    var statistic: StatisticModel

    var body: some View {
        
        HStack {
            Text("\(self.statistic.country ?? "")")
                .font(.body)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                .foregroundColor(Color(hex: "00bcd4"))

            Text("\(self.statistic.deaths?.new ?? "")")
                .font(.body)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                .foregroundColor(Color(hex: "ff5722"))

            Text("\(self.statistic.deaths?.total ?? 0)")
                .font(.body)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                .foregroundColor(Color(hex: "dd2c00"))
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 40, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView(statistic: StatisticModel(continent: nil, country: nil, population: nil, cases: nil, deaths: nil, tests: nil, day: nil, time: nil))
    }
}
