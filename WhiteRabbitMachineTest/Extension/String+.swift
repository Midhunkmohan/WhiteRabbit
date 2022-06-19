//
//  String+.swift
//  WhiteRabbitMachineTest
//
//  Created by Midhun KM on 19/06/22.
//

import Foundation


extension String {
    
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
}
