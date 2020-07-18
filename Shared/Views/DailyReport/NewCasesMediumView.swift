//
//  NewCasesMediumView.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 18.07.2020.
//

import SwiftUI
import WidgetKit

struct NewCasesMediumView: View {
    
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
            
            HStack(spacing: 0) {
                WidgetNumbersView(title: "New Cases", value: "\(statistic.cases?.new ?? "")", containsDate: false)
                    .widgetNumbersStyle(backgroundColor: Color.caseColor)
                WidgetNumbersView(title: "Active Cases", value: "\(statistic.cases?.active ?? 0)", containsDate: false)
                    .widgetNumbersStyle(backgroundColor: Color.caseColor)
            }
            
            HStack(spacing: 0) {
                WidgetNumbersView(title: "New Deaths", value: "\(statistic.deaths?.new ?? "")", containsDate: false)
                    .widgetNumbersStyle(backgroundColor: Color.dateColor)
                WidgetNumbersView(title: "Total Deaths", value: "\(statistic.deaths?.total ?? 0)", containsDate: false)
                    .widgetNumbersStyle(backgroundColor: Color.dateColor)
            }
            
        }.background(Color.clear)
    }
}

struct NewCasesMediumView_Previews: PreviewProvider {
    static var previews: some View {
        NewCasesMediumView(statistic: StatisticModel.testData)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
