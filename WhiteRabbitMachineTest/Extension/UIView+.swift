//
//  UIView+.swift
//  WhiteRabbitMachineTest
//
//  Created by Midhun KM on 19/06/22.
//

import Foundation
import UIKit

extension UIView {
    
    class func loadNib<T: UIView>(_ viewType: T.Type) -> T {
        let className = String.className(viewType)
        return Bundle(for: viewType).loadNibNamed(className, owner: self, options: nil)!.first as! T
    }
    
    class func loadNib() -> Self {
            return loadNib(self)
    }
}
