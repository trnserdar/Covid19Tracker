//
//  NetworkClient.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 7.07.2020.
//

import Foundation
import Alamofire

class NetworkClient: ServiceClient {
    
    public static func getStatistics(completion: @escaping (_ response: StatisticResponseModel?, _ error: Error?) -> Void) {
        makeRequest(route: NetworkRouter.statistics, decodingType: StatisticResponseModel.self, completion: completion)
    }
    
    public static func getHistory(day: String, country: String, completion: @escaping (_ response: StatisticResponseModel?, _ error: Error?) -> Void) {
        makeRequest(route: NetworkRouter.history(day: day, country: country), decodingType: StatisticResponseModel.self, completion: completion)
    }
}


