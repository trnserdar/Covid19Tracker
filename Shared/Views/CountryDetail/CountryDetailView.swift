//
//  CountryDetailView.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 8.07.2020.
//

import SwiftUI

struct CountryDetailView: View {
    
    var statistic: StatisticModel
    
    var body: some View {
        
        ScrollView {
            DateView(date: statistic.time ?? "")
            
            if statistic.tests != nil {
                TestView(testNumbers: statistic.tests!)
            }

            if statistic.cases != nil {
                CaseView(caseNumbers: statistic.cases!)
            }
            
            if statistic.deaths != nil {
                DeathView(deathNumbers: statistic.deaths!)
            }
        }
        .navigationTitle(statistic.country ?? "")
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(statistic: StatisticModel(continent: Continent.asia, country: "Turkey", population: 84349028, cases: NumbersModel(new: "+1086", active: 18608, critical: 1130, recovered: 182995, the1MPop: nil, total: 206844), deaths: NumbersModel(new: "+16", active: nil, critical: nil, recovered: nil, the1MPop: nil, total: 5241), tests: NumbersModel(new: nil, active: nil, critical: nil, recovered: nil, the1MPop: nil, total: 3682673), day: "2020-07-07", time: "2020-07-07T12:30:06+00:00"))
    }
}
