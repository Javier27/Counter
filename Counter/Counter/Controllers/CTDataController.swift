//
//  CTDataController.swift
//  Counter
//
//  Created by Richard Davis on 11/10/15.
//  Copyright © 2015 Richard Davis. All rights reserved.
//

import UIKit
import RealmSwift

class CTDataController: NSObject {

  static let sharedInstance = CTDataController()
  let dateFormatter = NSDateFormatter()
  
  override init() {
    super.init()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
  }
  
  func initFactorPropertyTypes() {
    do {
      let realm = try Realm(path: Realm.defaultPath)
      if realm.objects(CTFactorPropertyType).count == 0 {
        try! realm.write() {
          // create the property types
          for factorPropertyType in CTEntryType.allValues {
            realm.add(CTFactorPropertyType(type: factorPropertyType))
          }
          
          // now create the basic nutrition feature
          let factor = CTFactor(title: "Nutrition")
          realm.add(factor)
          
          let calorieProperty = CTFactorProperty(factorCode: "Nutrition", type: CTFactorPropertyType.objForType(CTEntryType.Count), title: "Calories", desc: "Calories Consumed")
          realm.add(calorieProperty)
          factor.properties.append(calorieProperty)
          
          let carbProperty = CTFactorProperty(factorCode: "Nutrition", type: CTFactorPropertyType.objForType(CTEntryType.Count), title: "Carbohydrates", desc: "Carbohydrates Consumed")
          realm.add(carbProperty)
          factor.properties.append(carbProperty)
          
          let proteinProperty = CTFactorProperty(factorCode: "Nutrition", type: CTFactorPropertyType.objForType(CTEntryType.Count), title: "Protein", desc: "Protein Consumed")
          realm.add(proteinProperty)
          factor.properties.append(proteinProperty)
          
          let fatProperty = CTFactorProperty(factorCode: "Nutrition", type: CTFactorPropertyType.objForType(CTEntryType.Count), title: "Fat", desc: "Fat Consumed")
          realm.add(fatProperty)
          factor.properties.append(fatProperty)
        }
      }
      
    } catch {
      // not going to handle as this should never hit
    }
  }
  
  func toString(date: NSDate) -> String {
    return dateFormatter.stringFromDate(date)
  }
  
  func toDate(string: String) -> NSDate {
    return dateFormatter.dateFromString(string)!
  }

}
