//
//  CTDashboardViewController.swift
//  Counter
//
//  Created by Richard Davis on 11/10/15.
//  Copyright © 2015 Richard Davis. All rights reserved.
//

import UIKit

class CTDashboardViewController: CTBaseViewController {
  
  @IBOutlet weak var todayLabel: UILabel!
  @IBOutlet weak var thisWeekLabel: UILabel!
  @IBOutlet weak var caloriesTextField: UITextField!
  @IBOutlet weak var carbsTextField: UITextField!
  @IBOutlet weak var proteinTextField: UITextField!
  @IBOutlet weak var fatTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    syncViewWithData()
  }
  
  @IBAction func addEntry(sender: AnyObject) {
    let nutritionFactor = CTFactor.defaultRealm()?.objectForPrimaryKey(CTFactor.self, key: "Nutrition")
    let realm = CTFactorPropertyEntry.defaultRealm()
    for factorProperty in (nutritionFactor?.properties)! {
      try! realm!.write() {
        if factorProperty.title == "Calories" {
          realm!.add(CTFactorPropertyEntry(factorPropertyId: factorProperty.propertyId, val: Int(self.caloriesTextField.text!)!, desc: "random description"))
        } else if factorProperty.title == "Carbohydrates" {
          realm!.add(CTFactorPropertyEntry(factorPropertyId: factorProperty.propertyId, val: Int(self.carbsTextField.text!)!, desc: "random description"))
        } else if factorProperty.title == "Protein" {
          realm!.add(CTFactorPropertyEntry(factorPropertyId: factorProperty.propertyId, val: Int(self.proteinTextField.text!)!, desc: "random description"))
        } else if factorProperty.title == "Fat" {
          realm!.add(CTFactorPropertyEntry(factorPropertyId: factorProperty.propertyId, val: Int(self.fatTextField.text!)!, desc: "random description"))
        }
      }
    }
    
    syncViewWithData()
  }
  
  func syncViewWithData() {
    caloriesTextField.text = nil
    carbsTextField.text = nil
    proteinTextField.text = nil
    fatTextField.text = nil
    
    let nutritionFactor = CTFactor.defaultRealm()?.objectForPrimaryKey(CTFactor.self, key: "Nutrition")
    var calorieProperty: CTFactorProperty?
    for factorProperty in (nutritionFactor?.properties)! {
      if factorProperty.title == "Calories" {
        calorieProperty = factorProperty
      }
    }
    
    if let property = calorieProperty {
      
      let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
      let components = calendar?.components([.Year, .Month, .Day], fromDate: NSDate())
      let startOfDay = calendar?.dateFromComponents(components!)
      let dayPredicate = NSPredicate(format: "factorPropertyId == %@ AND createdAt BETWEEN {%@, %@}", argumentArray: [property.propertyId, startOfDay!, NSDate()])
      let results = CTFactorPropertyEntry.defaultRealm()?.objects(CTFactorPropertyEntry).filter(dayPredicate)
      
      var total = 0
      for result in results! {
        total += result.val
      }
      
      todayLabel.text = "Calories Today: \(total)"
      
      // technically we want this to be week based so M-S or something
      components?.day -= 7
      let startOfWeek = calendar?.dateFromComponents(components!)
      let weekPredicate = NSPredicate(format: "factorPropertyId == %@ AND createdAt BETWEEN {%@, %@}", argumentArray: [property.propertyId, startOfWeek!, NSDate()])
      let weekResults = CTFactorPropertyEntry.defaultRealm()?.objects(CTFactorPropertyEntry).filter(weekPredicate)
      
      total = 0
      for result in weekResults! {
        total += result.val
      }
      
      thisWeekLabel.text = "Calories This Week: \(total)"
    }
  }
  
  
}
