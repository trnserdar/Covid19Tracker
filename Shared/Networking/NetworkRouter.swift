//
//  NetworkRouter.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 7.07.2020.
//

import Foundation
import Alamofire

// MARK: - NetworkRouter
enum NetworkRouter: URLRequestConvertible {
    
    // MARK: - URL
    static let baseURLPath = NetworkConstants.baseURL
    
    // MARK: - Instance Properties
    case statistics
    case history(day: String, country: String)

    
    // MARK: - Method
    var method: HTTPMethod {
        switch self {
        case .statistics, .history:
                return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .statistics:
            return "/statistics"
        case .history:
            return "/history"
        }
    }
    
    // MARK: - Parameters
    var parameters: [String: Any] {
        
        switch self {
        case .history(day: let day, country: let country):
            return ["day": day, "country": country]
        default:
            return [:]
        }
    }
    
    // MARK: - URLRequest
    public func asURLRequest() throws -> URLRequest {
                
        let url = try NetworkRouter.baseURLPath.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = 20
        
        request.addValue("covid-193.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.addValue(NetworkConstants.apiKey, forHTTPHeaderField: "x-rapidapi-key")
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
    
}
