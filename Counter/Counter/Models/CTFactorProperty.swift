//
//  CTFactorProperty.swift
//  Counter
//
//  Created by Richard Davis on 11/10/15.
//  Copyright © 2015 Richard Davis. All rights reserved.
//

import UIKit

class CTFactorProperty: CTBaseRealmObject {

  dynamic var propertyId: String = ""
  dynamic var type: CTFactorPropertyType?
  dynamic var title: String = ""
  dynamic var desc: String = ""
  
  convenience init(factorCode: String, type: CTFactorPropertyType, title: String, desc: String) {
    self.init()
    
    self.propertyId = "\(factorCode).\(title)"
    self.type = type
    self.title = title
    self.desc = desc
  }
  
  override static func primaryKey() -> String? {
    return "propertyId"
  }
  
}
