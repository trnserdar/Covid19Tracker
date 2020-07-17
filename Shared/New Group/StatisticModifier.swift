//
//  StatisticModifier.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 18.07.2020.
//

import SwiftUI

struct StatisticModifier: ViewModifier {
    
    var backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(.white)
            .background(backgroundColor)
            .cornerRadius(16.0)
            .padding()
    }
}
