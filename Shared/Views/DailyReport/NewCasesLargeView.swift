//
//  NewCasesLargeView.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 18.07.2020.
//

import SwiftUI
import WidgetKit

struct NewCasesLargeView: View {
    
    var statistic: StatisticModel
    var statisticWorld: StatisticModel?
    
    
    var body: some View {
        
        VStack {
            NewCasesMediumView(statistic: statistic)
            
            if statisticWorld != nil {
                NewCasesMediumView(statistic: statisticWorld!)
            }
        }
        .background(Color.white)
    }
}

struct NewCasesLargeView_Previews: PreviewProvider {
    static var previews: some View {
        NewCasesLargeView(statistic: StatisticModel.testData, statisticWorld: StatisticModel.testData)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
