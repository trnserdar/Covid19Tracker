//
//  StatisticResponseModel.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 7.07.2020.
//

import Foundation

struct StatisticResponseModel: Codable {

    let results: Int?
    let response: [StatisticModel]?

    enum CodingKeys: String, CodingKey {
        case results, response
    }
}
