//
//  View+Modifiers.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 18.07.2020.
//

import SwiftUI

extension View {
    
    func titleStyle() -> some View {
        self.modifier(TitleModifier())
    }
    
    func bodyStyle() -> some View {
        self.modifier(BodyModifier())
    }
    
    func numbersStyle() -> some View {
        self.modifier(NumbersModifier())
    }
    
    func statisticStyle(backgroundColor: Color) -> some View {
        self.modifier(StatisticModifier(backgroundColor: backgroundColor))
    }
}
