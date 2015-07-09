//
//  NameListDataSource.swift
//  PairRandomizer
//
//  Created by Douglas Voss on 7/9/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

import UIKit

class NameListDataSource: NSObject, UITableViewDataSource {
   
    let kCellId = "name.list.cell.id"
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(kCellId, forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel!.text = StudentListSingleton.sharedInstance.studentList[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentListSingleton.sharedInstance.studentList.count
    }
}
