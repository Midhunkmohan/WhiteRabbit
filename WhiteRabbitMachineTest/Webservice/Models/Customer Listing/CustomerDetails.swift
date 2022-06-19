//
//  CustomerDetails.swift
//  WhiteRabbitMachineTest
//
//  Created by Midhun KM on 19/06/22.
//

import Foundation
import ObjectMapper

class CustomerDetails: NSObject, Mappable {
    
    var address : Address?
    var company : CompanyModel?
    var email : String?
    var id : Int?
    var name : String?
    var phone : String?
    var profileImage : String?
    var username : String?
    var website : String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        address <- map["address"]
        company <- map["company"]
        email <- map["email"]
        id <- map["id"]
        name <- map["name"]
        phone <- map["phone"]
        profileImage <- map["profile_image"]
        username <- map["username"]
        website <- map["website"]
        
    }
}
 
