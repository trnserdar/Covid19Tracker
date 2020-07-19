//
//  StatisticView.swift
//  Covid19TrackerWatch WatchKit Extension
//
//  Created by Serdar Turan on 19.07.2020.
//

import SwiftUI

struct StatisticView: View {
    
    @State private var statistics: [StatisticModel] = []

    var body: some View {
        
        NavigationView {
            
            ScrollView {
                LazyVStack {
                    ForEach((0..<self.statistics.count), id: \.self) { index in
                        CountryView(statistic: self.statistics[index])
                    }
                }
            }
            .onAppear(perform: getStatistics)
            .navigationTitle("Covid 19 Tracker")
        }
    }
    
    func getStatistics() {
        
        NetworkClient.getStatistics { (response, error) in
        
            guard error == nil else {
                print("getStatistics Error: \(error!.localizedDescription)")
                return
            }
            
            guard let response = response,
                  let list = response.response else {
                print("getStatistics list empty")
                return
            }
            
            DispatchQueue.main.async {
                self.statistics = list.sorted(by: {$0.deaths?.total ?? 0 > $1.deaths?.total ?? 0})
            }
        }
        
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView()
    }
}
