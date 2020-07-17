//
//  WidgetNumbersView.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 18.07.2020.
//

import SwiftUI

struct WidgetNumbersView: View {
    
    var title: String
    var value: String
    var containsDate: Bool
    
    var body: some View {
        VStack {
            Text(title)
                .font(containsDate ? .headline : .callout)
            Text(value)
                .font(containsDate ? .callout : .headline)
        }
    }
}

struct WidgetNumbersView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetNumbersView(title: "Turkey", value: "0101", containsDate: true)
    }
}
