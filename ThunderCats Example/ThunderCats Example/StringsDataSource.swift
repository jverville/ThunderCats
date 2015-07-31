//
//  StringsDataSource.swift
//  ThunderCats Example
//
//  Created by Kyle Bashour on 7/31/15.
//  Copyright (c) 2015 Metova. All rights reserved.
//

import UIKit
import ThunderCats

class StringsDataSource: NSObject, UITableViewDataSource {
    
    let classMethods = [
        Example(description: "Generate a UUID: \(String.tc_UUID()). Returns a string.", code: "String.tc_UUID()"),
    ]
    
    let instanceMethods = [
        Example(description: "Ask a string whether or not it's a valid email address. Returns a bool.", code: "let email = \"test@metova.com\"\n\n// returns true\nemail.tc_isValidEmailAddressFormat()"),
        Example(description: "Determine whether a substring is present within the string.", code: "let string = \"This is a string\"\n\n// returns true\nstring.tc_containsString(\"is a\")")
    ]
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Class Methods" : "Instance Methods"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? classMethods.count : instanceMethods.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.exampleCellID) as! ExampleCell
        cell.setupWithExample(indexPath.section == 0 ? classMethods[indexPath.row] : instanceMethods[indexPath.row])
        return cell
    }
}
