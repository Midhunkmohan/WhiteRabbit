//
//  Address.swift
//  WhiteRabbitMachineTest
//
//  Created by Midhun KM on 19/06/22.
//

import Foundation
import ObjectMapper

class Address: NSObject, Mappable {
    
    var city : String?
    var geo : String?
    var street : String?
    var suite : String?
    var zipcode : String?
    var address: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        city <- map["city"]
        geo <- map["geo"]
        street <- map["street"]
        suite <- map["suite"]
        zipcode <- map["zipcode"]
        address <- map["address"]
    }
}
