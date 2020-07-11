//
//  URLSessionServiceClient.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 11.07.2020.
//

import Foundation

class URLSessionServiceClient {
    
    static var statisticURLRequest: URLRequest {
        
        var urlRequest = URLRequest(url: URL(string: "\(NetworkConstants.baseURL)/statistics")!)
        urlRequest.httpMethod = "GET"
        urlRequest.timeoutInterval = 20
        
        urlRequest.addValue("covid-193.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        urlRequest.addValue(NetworkConstants.apiKey, forHTTPHeaderField: "x-rapidapi-key")
        return urlRequest
    }
    
    public static func getStatistics(completion: @escaping (_ response: StatisticResponseModel?, _ error: Error?) -> Void) {
        makeRequest(urlRequest: self.statisticURLRequest, decodingType: StatisticResponseModel.self, completion: completion)
    }
    
    static func makeRequest<T: Codable>(urlRequest: URLRequest, decodingType: T.Type, completion: @escaping (_ response: T?, _ error: Error?) -> Void) {
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(response, error)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
