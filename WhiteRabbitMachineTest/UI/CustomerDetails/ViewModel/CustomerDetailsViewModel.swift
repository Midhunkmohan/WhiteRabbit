//
//  CustomerDetailsViewModel.swift
//  WhiteRabbitMachineTest
//
//  Created by Midhun KM on 19/06/22.
//

import Foundation

struct CustomerModel {
    var email: String?
    var website: String?
    var phoneNumber: String?
    var address: String
}

class CustomerDetailsViewModel {
    
    var customerDetailsModel = CustomerDetails() {
        didSet {
            setCustomerModel(with: customerDetailsModel)
        }
    }
    
    var customerModel = [String: Any]()
    
    func setCustomerModel(with model: CustomerDetails) {
        let email = model.email ?? ""
        let website = model.website ?? ""
        let company  = model.company?.name ?? ""
        self.customerModel["Email"] = email
        self.customerModel["Company"] = company
        if let address = model.address {
            let city = address.city ?? ""
            let street = address.street ?? ""
            let zipCode = address.zipcode ?? ""
            self.customerModel["Address"] = city+", "+street+", "+zipCode
        }
        
        self.customerModel["Website"] = website
    }
}
