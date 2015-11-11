//
//  CTFactor.swift
//  Counter
//
//  Created by Richard Davis on 11/10/15.
//  Copyright © 2015 Richard Davis. All rights reserved.
//

import UIKit
import RealmSwift

class CTFactor: CTBaseRealmObject {
  dynamic var title: String = ""
  let properties = List<CTFactorProperty>()
  
  convenience init(title: String) {
    self.init()
    self.title = title
  }
  
  override static func primaryKey() -> String? {
    return "title"
  }
}
