//
//  CustomerListingViewModel.swift
//  WhiteRabbitMachineTest
//
//  Created by Midhun KM on 19/06/22.
//

import Foundation


class CustomerListViewModel {
    
    var arrayOfCustomer = [CustomerDetails]()
    var arrayOfFilteredCustomer = [CustomerDetails]()
    
    func getCustomerList(handler: @escaping (Bool) -> Void) {
        WebserviceRequest.shared.getCustomerListFromServer { [weak self] success, responseObject, error in
            if success {
                guard let response = responseObject as? [CustomerDetails] else {
                    print("Can't parse the data")
                    return
                }
                self?.arrayOfCustomer = response
                self?.arrayOfFilteredCustomer = response
                handler(success)
            } else {
                print(error?.localizedDescription)
                handler(success)
            }
        }
    }
}
