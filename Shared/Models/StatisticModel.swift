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
    
    static let testData = StatisticModel(continent: Continent.asia, country: "Turkey", population: 84349028, cases: NumbersModel(new: "+1086", active: 18608, critical: 1130, recovered: 182995, the1MPop: nil, total: 206844), deaths: NumbersModel(new: "+16", active: nil, critical: nil, recovered: nil, the1MPop: nil, total: 5241), tests: NumbersModel(new: nil, active: nil, critical: nil, recovered: nil, the1MPop: nil, total: 3682673), day: "2020-07-07", time: "2020-07-07T12:30:06+00:00")
}
