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
            Text("Total Tests")
                .font(.headline)
            Text("\(self.testNumbers.total ?? 0)")
                .font(.body)
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color(hex: "b2ebf2"))
        .cornerRadius(16.0)
        .padding()
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(testNumbers: NumbersModel(new: nil, active: nil, critical: nil, recovered: nil, the1MPop: nil, total: 3682673))
    }
}
