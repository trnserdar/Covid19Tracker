//
//  TestView.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 8.07.2020.
//

import SwiftUI

struct TestView: View {
    
    var testNumbers: NumbersModel
    
    var body: some View {
        
        VStack {
            NumbersView(title: "Total Tests", value: "\(self.testNumbers.total ?? 0)")
        }
        .statisticStyle(backgroundColor: Color.testColor)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(testNumbers: NumbersModel(new: nil, active: nil, critical: nil, recovered: nil, the1MPop: nil, total: 3682673))
    }
}
