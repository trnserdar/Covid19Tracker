//
//  CountryModifier.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 18.07.2020.
//

import SwiftUI

struct CountryModifier: ViewModifier {
    
    var foregroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.body)
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
            .foregroundColor(foregroundColor)
    }
}

