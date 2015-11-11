//
//  CTBaseRealmObject.swift
//  Counter
//
//  Created by Richard Davis on 11/10/15.
//  Copyright © 2015 Richard Davis. All rights reserved.
//

import UIKit
import RealmSwift

class CTBaseRealmObject: Object {
  
  static func defaultRealm() -> Realm? {
    do {
      let realm = try Realm(path: Realm.defaultPath)
      return realm
    } catch {
      return nil
    }
  }
}
