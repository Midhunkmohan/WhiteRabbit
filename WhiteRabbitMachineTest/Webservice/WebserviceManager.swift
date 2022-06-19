//
//  WebserviceManager.swift
//  WhiteRabbitMachineTest
//
//  Created by Midhun KM on 19/06/22.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

typealias WebServiceCompletionHandler = (_ success: Bool, _ responseObject: AnyObject?, _ error: NSError?) -> Void

class WebserviceManager {
    
    static let shared = WebserviceManager()
    
    func requestArray<T: Mappable>(with url: String, method: HTTPMethod, parameter: [String: Any]?, header: HTTPHeaders?, mappableOf: [T].Type, completionHandler: @escaping WebServiceCompletionHandler) {
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        
        // Alamofire Request
        manager.request(url, method: method, parameters: parameter, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseArray {(response: DataResponse<[T]>) in
                switch response.result {
                case .success(let successResult): // Success 200
                    if let item = successResult.toJSON() as? [NSDictionary] {
                        debugPrint(item)
                    }
                    completionHandler(true, successResult as AnyObject, nil)
                case.failure(let error): // Failed
                    let networkError = NSError(domain: "Error", code: error._code, userInfo: nil)
                    completionHandler(false, nil, networkError)
                }
            }
    }
}


