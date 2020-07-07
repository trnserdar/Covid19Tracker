//
//  StatisticView.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 7.07.2020.
//

import SwiftUI

struct StatisticView: View {
    
    @State private var statistics: [StatisticModel] = []
    
    var body: some View {
        
        NavigationView {
            
            VStack {
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
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 40, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
                ScrollView {

                    LazyVStack {
                        
                        ForEach((0..<self.statistics.count), id: \.self) { index in
                        
                            HStack {
                                Text("\(self.statistics[index].country ?? "")")
                                    .font(.body)
                                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                                    .foregroundColor(Color(hex: "00bcd4"))

                                Text("\(self.statistics[index].deaths?.new ?? "")")
                                    .font(.body)
                                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                                    .foregroundColor(Color(hex: "ff5722"))

                                Text("\(self.statistics[index].deaths?.total ?? 0)")
                                    .font(.body)
                                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                                    .foregroundColor(Color(hex: "dd2c00"))
                            }
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 40, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        }
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
