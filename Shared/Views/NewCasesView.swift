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
            WidgetNumbersView(title: "\(statistic.country ?? "")", value: "\(dateWithFormat)", containsDate: true)
                .widgetNumbersStyle(backgroundColor: Color.dateColor)
            WidgetNumbersView(title: "New Cases", value: "\(statistic.cases?.new ?? "")", containsDate: false)
                .widgetNumbersStyle(backgroundColor: Color.caseColor)
            WidgetNumbersView(title: "New Deaths", value: "\(statistic.deaths?.new ?? "")", containsDate: false)
                .widgetNumbersStyle(backgroundColor: Color.dateColor)
        }
        .background(Color.clear)
    }
}

struct NewCasesView_Previews: PreviewProvider {
    static var previews: some View {
        NewCasesView(statistic: StatisticModel.testData)
    }
}
