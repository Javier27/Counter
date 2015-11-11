//
//  CTFactorPropertyEntry.swift
//  Counter
//
//  Created by Richard Davis on 11/10/15.
//  Copyright © 2015 Richard Davis. All rights reserved.
//

import UIKit

class CTFactorPropertyEntry: CTBaseRealmObject {
  
  dynamic var factorPropertyId: String = ""
  dynamic var val: Int = 0
  dynamic var desc: String = ""
  dynamic var createdAt: NSDate = NSDate()
  dynamic var updatedAt: NSDate = NSDate()
  
  convenience init(factorPropertyId: String, val: Int, desc: String) {
    self.init()
    
    self.factorPropertyId = factorPropertyId
    self.val = val
    self.desc = desc
  }

}
