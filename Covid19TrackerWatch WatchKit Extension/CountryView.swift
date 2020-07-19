//
//  CountryView.swift
//  Covid19TrackerWatch WatchKit Extension
//
//  Created by Serdar Turan on 19.07.2020.
//

import SwiftUI

struct CountryView: View {
    
    var statistic: StatisticModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5.0) {
            Text(statistic.country ?? "")
                .titleStyle()
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            Text("New Cases: \(statistic.cases?.new ?? "")")
                .bodyStyle()
                .lineLimit(2)
            Text("New Deaths: \(statistic.deaths?.new ?? "")")
                .bodyStyle()
                .lineLimit(2)
            Divider()
        }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView(statistic: StatisticModel.testData)
    }
}
