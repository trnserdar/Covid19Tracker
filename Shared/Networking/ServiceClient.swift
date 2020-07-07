//
//  ServiceClient.swift
//  Covid19Tracker
//
//  Created by Serdar Turan on 7.07.2020.
//

import Foundation
import Alamofire

class ServiceClient {
    
    static func makeRequest<T: Codable>(route: URLRequestConvertible, decodingType: T.Type, completion: @escaping (_ response: T?, _ error: Error?) -> Void) {
        
        AF.request(route).validate().responseDecodable(of: T.self) { (response) in
            completion(response.value, response.error)
        }
    }
}
