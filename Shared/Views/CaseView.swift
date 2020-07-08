//
//  CaseView.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 8.07.2020.
//

import SwiftUI

struct CaseView: View {
    
    var caseNumbers: NumbersModel
    
    var body: some View {
        
        VStack {
            HStack {
                VStack {
                    Text("New Cases")
                        .font(.headline)
                    Text("\(self.caseNumbers.new ?? "")")
                        .font(.body)
                }
                .frame(minWidth: 0, maxWidth: .infinity)

                VStack {
                    Text("Active Cases")
                        .font(.headline)
                    Text("\(self.caseNumbers.active ?? 0)")
                        .font(.body)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            
            HStack {
                VStack {
                    Text("Critical Cases")
                        .font(.headline)
                    Text("\(self.caseNumbers.critical ?? 0)")
                        .font(.body)
                }
                .frame(minWidth: 0, maxWidth: .infinity)

                VStack {
                    Text("Recovered Cases")
                        .font(.headline)
                    Text("\(self.caseNumbers.recovered ?? 0)")
                        .font(.body)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            
            VStack {
                Text("Total Cases")
                    .font(.headline)
                Text("\(self.caseNumbers.total ?? 0)")
                    .font(.body)
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .background(Color(hex: "ff5722"))
        .cornerRadius(16.0)
        .padding()
    }
}

struct CaseView_Previews: PreviewProvider {
    static var previews: some View {
        CaseView(caseNumbers: NumbersModel(new: "+1086", active: 18608, critical: 1130, recovered: 182995, the1MPop: nil, total: 206844))
    }
}
