//
//  DeathView.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 8.07.2020.
//

import SwiftUI

struct DeathView: View {
    
    var deathNumbers: NumbersModel
    
    var body: some View {
        
        HStack {
            NumbersView(title: "New Deaths", value: "\(self.deathNumbers.new ?? "")")
            NumbersView(title: "Total Deaths", value: "\(self.deathNumbers.total ?? 0)")
        }
        .statisticStyle(backgroundColor: Color.dateColor)
    }
}

struct DeathView_Previews: PreviewProvider {
    static var previews: some View {
        DeathView(deathNumbers: NumbersModel(new: "+16", active: nil, critical: nil, recovered: nil, the1MPop: nil, total: 5241))
    }
}
