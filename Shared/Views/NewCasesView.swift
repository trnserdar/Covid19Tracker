//
//  NewCasesView.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 11.07.2020.
//

import SwiftUI

struct NewCasesView: View {
    
    var statistic: StatisticModel
    
    var dateWithFormat: String {
        
        guard let date = statistic.time else {
            return ""
        }
        
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let tmpDate = inputDateFormatter.date(from: date) else {
            return ""
        }
        
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "E, d MMM HH:mm"
        return outputDateFormatter.string(from: tmpDate)
    }
    
    var body: some View {
       
        VStack {
            VStack {
                Text("\(statistic.country ?? "")")
                    .font(.headline)
                Text("\(dateWithFormat)")
                    .font(.callout)
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color(hex: "204051"))
            .foregroundColor(.white)
            
            VStack {
                Text("New Cases")
                    .font(.callout)
                Text("\(statistic.cases?.new ?? "")")
                    .font(.headline)
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color(hex: "3b6978"))
            .foregroundColor(.white)
            
            VStack {
                Text("New Deaths")
                    .font(.callout)
                Text("\(statistic.deaths?.new ?? "")")
                    .font(.headline)
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color(hex: "204051"))
            .foregroundColor(.white)
        }
        .background(Color.clear)
    }
}

struct NewCasesView_Previews: PreviewProvider {
    static var previews: some View {
        NewCasesView(statistic: StatisticModel.testData)
    }
}
