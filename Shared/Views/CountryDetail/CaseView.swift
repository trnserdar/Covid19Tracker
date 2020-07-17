//
//  CaseView.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 8.07.2020.
//

import SwiftUI

struct CaseView: View {
    
    var caseNumbers: NumbersModel
    
    var body: some View {
        
        VStack {
            HStack {
                NumbersView(title: "New Cases", value: "\(self.caseNumbers.new ?? "")")
                NumbersView(title: "Active Cases", value: "\(self.caseNumbers.active ?? 0)")
            }
            .numbersStyle()
            
            HStack {
                NumbersView(title: "Critical Cases", value: "\(self.caseNumbers.critical ?? 0)")
                NumbersView(title: "Recovered Cases", value: "\(self.caseNumbers.recovered ?? 0)")
            }
            .numbersStyle()
            
            NumbersView(title: "Total Cases", value: "\(self.caseNumbers.total ?? 0)")
                .numbersStyle()
        }
        .statisticStyle(backgroundColor: Color.caseColor)
    }
}

struct CaseView_Previews: PreviewProvider {
    static var previews: some View {
        CaseView(caseNumbers: NumbersModel(new: "+1086", active: 18608, critical: 1130, recovered: 182995, the1MPop: nil, total: 206844))
    }
}
