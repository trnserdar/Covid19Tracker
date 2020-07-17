//
//  WidgetNumbersModifier.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 18.07.2020.
//

import SwiftUI

struct WidgetNumbersModifier: ViewModifier {

    var backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(backgroundColor)
            .foregroundColor(.white)
    }
}
