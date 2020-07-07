//
//  StatisticModel.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 7.07.2020.
//

import Foundation

struct StatisticModel: Codable {
    
    let continent: Continent?
    let country: String?
    let population: Int?
    let cases: NumbersModel?
    let deaths: NumbersModel?
    let tests: NumbersModel?
    let day: String?
    let time: String?
}
