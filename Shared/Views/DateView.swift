//
//  DateView.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 8.07.2020.
//

import SwiftUI

struct DateView: View {
    
    var date: String
    
    var dateWithFormat: String {
        
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let tmpDate = inputDateFormatter.date(from: date) else {
            return ""
        }
        
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss"
        return outputDateFormatter.string(from: tmpDate)
    }
    
    var body: some View {
        
        NumbersView(title: "Last Updated", value: dateWithFormat)
            .statisticStyle(backgroundColor: Color.testColor)
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(date: "2020-07-07T12:30:06+00:00")
    }
}
