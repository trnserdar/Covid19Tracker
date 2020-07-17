//
//  NumbersView.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 18.07.2020.
//

import SwiftUI

struct NumbersView: View {
    
    var title: String
    var value: String

    var body: some View {
        VStack {
            Text(title)
                .titleStyle()
            Text(value)
                .bodyStyle()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct NumbersView_Previews: PreviewProvider {
    static var previews: some View {
        NumbersView(title: "New Cases", value: "+14601")
    }
}
