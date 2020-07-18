//
//  StatisticHeaderView.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 8.07.2020.
//

import SwiftUI

struct StatisticHeaderView: View {
    
    @Environment(\.horizontalSizeClass) var sizeClass

    var body: some View {
        HStack {
            Text("Country")
                .headerStyle(backgroundColor: Color.testColor)
            
            if sizeClass != .compact {
                Text("New Cases")
                    .headerStyle(backgroundColor: Color.testColor)
            }
            
            Text("New Deaths")
                .headerStyle(backgroundColor: Color.caseColor)

            Text("Total Deaths")
                .headerStyle(backgroundColor: Color.dateColor)
        }
    }
}

struct StatisticHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticHeaderView()
    }
}
