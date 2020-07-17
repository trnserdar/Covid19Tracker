//
//  TitleModifier.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 18.07.2020.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
    }
}
