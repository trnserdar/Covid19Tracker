//
//  NumbersModel.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 7.07.2020.
//

import Foundation

struct NumbersModel: Codable {
    
    let new: String?
    let active, critical, recovered: Int?
    let the1MPop: String?
    let total: Int?

    enum CodingKeys: String, CodingKey {
        case new, active, critical, recovered
        case the1MPop = "1M_pop"
        case total
    }
}
