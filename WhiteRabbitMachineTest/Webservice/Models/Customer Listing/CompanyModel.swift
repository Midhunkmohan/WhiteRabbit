//
//  CompanyModel.swift
//  WhiteRabbitMachineTest
//
//  Created by Midhun KM on 19/06/22.
//

import Foundation
import ObjectMapper

class CompanyModel: NSObject, Mappable {
    
    var bs : String?
    var catchPhrase : String?
    var name : String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        bs <- map["bs"]
        catchPhrase <- map["catchPhrase"]
        name <- map["name"]
    }
}
