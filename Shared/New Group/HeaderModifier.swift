//
//  HeaderModifier.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 18.07.2020.
//

import SwiftUI

struct HeaderModifier: ViewModifier {
    
    var backgroundColor: Color

    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(.white)
            .background(backgroundColor)
            .cornerRadius(8.0)
    }

}
