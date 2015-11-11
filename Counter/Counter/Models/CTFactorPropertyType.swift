//
//  CTFactorPropertyType.swift
//  Counter
//
//  Created by Richard Davis on 11/10/15.
//  Copyright © 2015 Richard Davis. All rights reserved.
//

import UIKit

enum CTEntryType: String {
  case Count = "Count"
  case Time = "Time"
  case Money = "Money"
  
  static let allValues = [Count, Time, Money]
}

class CTFactorPropertyType: CTBaseRealmObject {

  var type: CTEntryType = CTEntryType.Count
  var typeString: String = "Count"
  
  convenience init(type: CTEntryType) {
    self.init()
    self.type = type
    typeString = type.rawValue
  }
  
  static func objForType(type: CTEntryType) -> CTFactorPropertyType {
    return (defaultRealm()?.objectForPrimaryKey(CTFactorPropertyType.self, key: type.rawValue))!
  }
  
  func typeDescription() -> String {
    type = CTEntryType(rawValue: typeString)!
    switch type {
    case .Count:
      return "Keep a running sum of this as a counter"
    case .Time:
      return "Track the amount of time spent doing this"
    case .Money:
      return "Follow the amount of money on this total"
    }
  }
  
  override static func primaryKey() -> String? {
    return "typeString"
  }
  
  override static func ignoredProperties() -> [String] {
    return ["type"]
  }
  
}
