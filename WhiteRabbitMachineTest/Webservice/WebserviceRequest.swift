//
//  WebserviceRequest.swift
//  WhiteRabbitMachineTest
//
//  Created by Midhun KM on 19/06/22.
//

import Foundation

class WebserviceRequest {
    
    static let shared = WebserviceRequest()
    
    
    
    /// To get customers list from server
    /// - Parameter handler: WebServiceCompletionHandler to handle response
    func getCustomerListFromServer(handler: @escaping WebServiceCompletionHandler) {

        let url = API.Customer.list
        
        WebserviceManager.shared.requestArray(with: url, method: .get, parameter: nil, header: nil, mappableOf: [CustomerDetails].self, completionHandler: handler)
    }
}
